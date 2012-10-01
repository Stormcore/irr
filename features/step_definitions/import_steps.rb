# encoding: utf-8

Допустим %{я обновляю и импортирую файл "$import_file_name" для роли "$role"} do |import_file_name, role|
  # Обновляем userid в файле сценария
  new_userid = get_login_and_password_for_role(role)['userid']
  raise "У пользователя с ролью '#{role}' нет userid" if new_userid.nil?

  import_path = "#{File.dirname(__FILE__)}/../import/#{import_file_name}"
  text = File.read(import_path)
  result = text.gsub(/\<user\-id\>.*\<\/user\-id\>/, "<user-id>#{new_userid}</user-id>")
  File.open(import_path, "w") {|file| file.puts result }

  # Устанавливаем соединение с сервером
  ssh_data = get_ssh_credentials
  import_output = ''
  Net::SSH.start(ssh_data['host'], ssh_data['login'], 
                 password: ssh_data['pass'], port: ssh_data['port']) do |ssh|
    # Копируем файл сценария на сервер
    filename = ssh_data['path'] + "/autoimport.xml"
    ssh.sftp.connect do |sftp|
      sftp.upload!(import_path, filename)
    end

    # Если на этой машине уже запущен импорт - ждём
    process_has_ended = false
    until process_has_ended
      wait_command = 'ps -ef | grep custom_import_test.php | grep -v grep | wc -l'
      wait_output = ssh.exec!(wait_command).to_s.force_encoding("UTF-8")
      process_has_ended = wait_output.to_i == 0
      sleep 5
    end

    # Переходим в каталог с кастомимпортом, Запускаем импорт и читаем лог
    import_command = 
          "cd #{ssh_data['path']} && ./custom_import_test.php autoimport.xml && " +
          'awk \'/^importing autoimport.xml/ { buf = "" } { buf = buf "\n" $0 } END { print buf }\' import.log'
    puts import_command
    import_output = ssh.exec!(import_command).to_s.force_encoding("UTF-8")
    puts "Лог импорта: <pre style='white-space:pre-wrap;'>#{import_output}</pre>"
  end

  # анализирует вывод импорта
  matches = /OK ads: (\d+), BAD ads: (\d+)/.match(import_output)
  raise "Не найдено сообщение о количестве импортированных файлов" if matches.nil?
  if matches[2].to_i > 0
    # Выводим ошибки
    error_text = import_output.split("\n").select{|l| l.include?('Error')}
    error_text.each {|l| puts "Ошибка: #{l}"}
    raise "Объявление было проимпортировано с ошибками"
  else
    # Делаем красивую ссылку на объявление
    /url = (.*)/.match(import_output) do |m|
      url = m[1].split(' ')[0]
      puts "DEBUG: Проимпортировано объявление <a href='#{url}'>#{url}</a>"
    end
  end
end
