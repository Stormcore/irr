# encoding: utf-8

Допустим /^в деталях объявления "(.*?)" равно "(.*?)"$/ do |field, value|
  on AdDetailsPage do |page|
    if field == "Цена"
      parameter = value.split(' ')[-1]
      page.get_value(field, parameter).should eq(value.split(' ')[0..-2]*' ')
    else
      page.get_value(field).should eq(value)
    end
  end
end

Допустим /^в деталях объявления указаны следующие данные:$/ do |table|
  actual = nil
  on AdDetailsPage do |page|
    actual = page.get_all_fields
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
    raise "Ошибка проверки деталей объявления"
  end
end
