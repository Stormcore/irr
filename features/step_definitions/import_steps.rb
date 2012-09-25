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
  import_output = ''
  Net::SSH.start('192.168.1.9', 'dev', password: 'devel') do |ssh|
    # Копируем файл сценария на сервер
    ssh.sftp.connect do |sftp|
      sftp.upload!(import_path, "/data/www/irr.ru.stream.final/utils/irr.ru/import/autoimport.xml")
    end

    # Переходим в каталог с кастомимпортом, Запускаем импорт и читаем лог
    import_command = 
          "cd /data/www/irr.ru.stream.final/utils/irr.ru/import/ &&" +
          "./custom_import_test.php autoimport.xml && " +
          'awk \'/^importing autoimport.xml/ { buf = "" } { buf = buf "\n" $0 } END { print buf }\' import.log'
    import_output = ssh.exec!(import_command).to_s.force_encoding("UTF-8")
    puts "Лог импорта: <pre>#{import_output}</pre>"
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
      puts "DEBUG: Проимпортировано объявление <a href='#{m[1]}>#{m[1]}</a>"
    end
  end
end
