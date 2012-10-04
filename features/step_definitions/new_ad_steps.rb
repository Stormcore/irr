# encoding: utf-8

То /^открыта страница выбора региона и категории$/ do
  on NewAdPage do |page|
    page.is_displayed?.should eq(true)
  end
end

Когда /^на странице выбора региона и категории я ввожу следующие данные:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
    case hash['поле']
    when "Регион"
      # TODO: Проверить текущее значение региона
      on NewAdPage do |page|
        page.open_region_selector
      end
      on RegionSelectPage do |page|
        page.select_region hash['значение']
      end

    when "Раздел"
      on NewAdPage do |page|
        page.set_section hash['значение']
      end

    else
      raise "Не найден параметр #{hash['поле']}"
    end
  end
end

Допустим /^я перехожу ко вводу деталей объявления$/ do
  on NewAdPage do |page|
    page.continue
  end
end

Допустим /^в секции "(.*?)" я ввожу следующие параметры:$/ do |section, table|
  on NewAdPage do |page|
    table.hashes.each do |hash|
      puts "Устанавливаем '#{hash['поле']}'='#{hash['значение']}'"
      page.set_value section, hash['поле'], hash['значение']
    end
  end
end

Допустим /^я загружаю фото при подаче объявления$/ do
  on NewAdPage do |page|
    page.upload_foto
  end
end

Допустим /^я размещаю объявление$/ do
  on NewAdPage do |page|
    page.submit_ad
  end
end

Допустим /^при подаче не показано сообщений об ошибке$/ do
  on NewAdPage do |page|
    raise "Ошибка при создании объявления: \n#{page.get_all_errors}" if page.has_errors?
  end
end

Допустим /^при подаче показано сообщение об ошибке "(.*)"$/ do |message|
  on NewAdPage do |page|
    page.has_errors?.should == true
    page.has_error_with_message?(message).should == true
  end
end

Допустим /^на странице ввода деталей обязательными являются следующие поля:$/ do |table|
  actual = nil
  on NewAdPage do |page|
    actual = page.get_all_required_fields
  end
  unless actual.sort == table.rows.sort
    actual_table = Cucumber::Ast::Table.new(actual.sort)
    expected_table = Cucumber::Ast::Table.new(table.rows.sort)
    File.open("/tmp/file1", 'w') {|f| 
      f.write(expected_table.to_s(options = {color: false})) }
    File.open("/tmp/file2", 'w') {|f| 
      f.write(actual_table.to_s(options = {color: false})) }

    # Разрываем таблицу
    puts "</table>"
    # Вставляем diff css + цвет черный (cucumber сделает красным)
    puts "<style type='text/css'>#{Diffy::CSS} .diff {color: black}</style>"
    # Выводим diff
    puts Diffy::Diff.new('/tmp/file1', '/tmp/file2', 
                         source:'files', diff: ['-w', '-U 10000']).to_s(:html)
    # Прячем оставшуюся таблицу
     puts "<table style='display:none'><tbody><tr><td>"

    # две пустых строчки комментариев
    # Из-за html кода ломается отображение контекста ошибки
    raise "Ошибка проверки обязательных полей"
  end
end
