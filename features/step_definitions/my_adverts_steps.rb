# encoding: utf-8
Когда /^в ЛК (ИП|ОП) открыт список объявлений пользователя$/ do |type|
  @classs = type == 'ИП' ? MyAdvertsPage : OPAdvertsPage
  on @classs do |page|
    page.wait_for_ads_loaded
  end
end


Когда /^в ЛК (ИП|ОП) объявление с названием "(.*)" присутствует в списке$/ do |type, title|
  @classs = type == 'ИП' ? MyAdvertsPage : OPAdvertsPage
  on @classs do |page|
    url = page.get_url_for_ad(title)
    @ad_id = page.get_ad_id(title)
    puts "Найдено объявление <a href='#{url}'>#{title}</a>, ID: #{@ad_id}"
    @title = title
  end
end

Когда /^в ЛК (ИП|ОП) объявление с названием "(.*)" отсутствует в списке$/ do |type, title|
  @classs = type == 'ИП' ? MyAdvertsPage : OPAdvertsPage
  on @classs do |page|
    lambda {page.get_ad_with_title(title)}.should raise_error,
      "Объявление '#{title}' присутствует в списке"
  end
end

Допустим /^в ЛК (ИП|ОП) я удаляю все объявления$/ do |type|
  @classs = type == 'ИП' ? MyAdvertsPage : OPAdvertsPage
  on @classs do |page|
    page.delete_all_ads
  end
end

То %{у объявления указан регион "$region"} do |region|
  on @classs do |page|
    page.get_region(@title).should == region
  end
end

То %{у объявления указан город "$city"} do |city|
  on @classs do |page|
    page.get_city(@title).should == city
  end
end

То %{у объявления указана цена "$price" в $currency} do |price, currency|
  on @classs do |page|
    case currency
    when "рублях"
      page.get_price(@title, "RUR").gsub(/руб./, '').should == price
    when "долларах"
      page.get_price(@title, "USD").gsub(/\$/, '').should == price
    when "евро"
      page.get_price(@title, "EUR").gsub(/€/, '').should == price
    end
  end
end

Допустим %{у объявления отображается загруженная фотография} do
  on @classs do |page|
    check_picture_availability page.get_photo(@title)
  end
end

Допустим %{статус созданного объявления равен "$expected"} do |expected|
  on @classs do |page|
    page.moderation_status(@title).should == expected
  end
end

Допустим %{дополнительный статус созданного объявления равен "$expected"} do |expected|
  on @classs do |page|
    page.moderation_additional_status(@title).should == expected
  end
end

Когда %{я открываю детали этого объявления} do
  on @classs do |page|
    url = page.get_url_for_ad(@title)
    puts "Открываю объявление <a href=#{url}>#{url}</a>"
    page.open_ad(@title)
  end
end

То %{на вкладке "Все" "$field" $operator "$expected"} do |field, operator, expected|
  on AdDetailsPage do |page|
    actual_value = page.get_parameter(field)
    case operator
    when "равно одному из"
      expected.split(', ').should include actual_value
    when "равно"
      actual_value.should eq(expected)
    when "в границах"
      expected_array = expected.split(" - ")
      actual_value.to_i.should be >= expected_array[0].to_i
      actual_value.to_i.should be <= expected_array[1].to_i
    when "содержит"
      actual_value.should include(expected)
    else
      eval("actual_value.to_i.should be #{operator} expected.to_i")
    end
  end
end

Допустим %{на вкладке "Все" присутствует "$field"} do |field|
  on AdDetailsPage do |page|
    page.get_parameter(field).should be_true, 
      "Параметр '#{field}' не установлен"
  end
end

Допустим /^на вкладке "Все" указаны следующие параметры:$/ do |table|
  errors = Hash.new
  on AdDetailsPage do |page|
    actual = page.get_all_parameters_on_all_tab

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
      puts Diffy::Diff.new('/tmp/file1', '/tmp/file2', :source => 'files').to_s(:html)
      # Прячем оставшуюся таблицу
      puts "<table style='display:none'><tbody><tr><td>"
      raise "Ошибка проверки деталей"
    end
  end
end

Допустим %{адрес в объявлении равен "$expected"} do |expected|
  on AdDetailsPage do |page|
    page.get_address.should eq(expected)
  end
end

Допустим %{шоссе в объявлении равно "$expected"} do |expected|
  on AdDetailsPage do |page|
    page.get_shosse.should eq(expected)
  end
end

То %{в деталях объявления отображается загруженная фотография} do
  on AdDetailsPage do |page|
    check_picture_availability  page.get_photo
  end
end

То %{в деталях объявления отображается загруженное видео} do
  on AdDetailsPage do |page|
    page.should have_video, "Видео отсутствует"
  end
end

Когда %{я редактирую данное объявление} do
  on @classs do |page|
    page.do_action(@title, "Редактировать")
  end
end

Когда %{я размещаю данное объявление} do
  on @classs do |page|
    page.do_place(@title)
  end
end

Допустим %{я поднимаю данное объявление} do
  on @classs do |page|
    page.do_action(@title, "Поднять")
  end

  on AdvertActionConfirmPage do |page|
    page.do_activate
  end
end

Допустим %{я делаю данное объявление премиумом $length} do |length|
  on @classs do |page|
    page.do_action(@title, "Премиум")
  end

  on AdvertActionConfirmPage do |page|
    page.select_premium_length(length)
    page.do_activate
  end
end

Допустим %{я выделяю данное объявление} do
  on @classs do |page|
    page.do_action(@title, "Выделить")
  end

  on AdvertActionConfirmPage do |page|
    page.do_activate
  end
end

Допустим %{я деактивирую данное объявление} do
  on @classs do |page|
    page.do_action(@title, "Деактивировать")
  end
  @browser.alert.ok
end

Допустим %{я удаляю данное объявление} do
  on @classs do |page|
    page.do_action(@title, "Удалить")
  end
  @browser.alert.ok
end

Допустим %{в ЛК данное объявление выделено} do
  on @classs do |page|
    page.is_ad_highlighted(@title).should == true
  end
end

Допустим %{в ЛК данное объявление является премиумом} do
  on @classs do |page|
    page.is_ad_premium(@title).should == true
  end
end

Допустим %{в ЛК ИП я выбираю регион "$region"} do |region|
  on MyAdvertsPage do |page|
    page.select_region(region)
  end
end

Допустим %{в ЛК ИП я выбираю пакет "$package"} do |package|
  on PackageInfoPage do |page|
    puts "DEBUG: Список пакетов: #{page.get_all_packages}"
    page.select_package(package)
  end
end

Допустим %{в ЛК ИП я запоминаю значение поля "$field"} do |field|
  on PackageInfoPage do |page|
    @stored_var = page.get_field_value(field).to_i
  end
end

То %{в ЛК ИП значение поля "$field" уменьшилось на единицу} do |field|
  on PackageInfoPage do |page|
    new_value = page.get_field_value(field).to_i
    (@stored_var - new_value).should == 1
  end
end

Допустим %{в ЛК ИП я перехожу на вкладку "$tab"} do |tab|
  on MyAdvertsPage do |page|
    page.open_tab(tab)
  end
end

Когда %{на странице оплаты я выбираю SMS} do
  on PaymentOptionsPage do |page|
    page.select_sms
    @text = page.get_sms_text
    @number = page.get_sms_number
  end
end

Допустим %{я отсылаю SMS для оплаты} do
  visit SMSDebugPage

  puts "DEBUG: Страница <a href='#{@browser.url}'>#{@browser.url}</a>, номер '#{@number}' текст '#{@text}'"

  on SMSDebugPage do |page|
    page.send_sms(@number, @text)
  end

  on SMSDebugResponse do |page|
    page.get_response.should include("Спасибо")
  end
end

Допустим %{я отсылаю SMS для оплаты используя казахский сендер} do
  visit SMSDebugKZPage

  puts "DEBUG: Страница <a href='#{@browser.url}'>#{@browser.url}</a>, номер '#{@number}' текст '#{@text}'"

  on SMSDebugKZPage do |page|
    page.send_sms(@text)
  end

  on SMSDebugKZResponse do |page|
    page.get_response.should include("Операция успешно выполнена")
  end
end

То %{в ЛК ИП на вкладке "$tab" отображены следующие секции:} do |tab, table|
  case tab
  when "Настройки"
    tab_page = MyAdvertsSettingsTabPage
  when "Статистика"
    tab_page = MyAdvertsViewsTabPage
  when "История"
    tab_page = MyAdvertsHistoryTabPage
  when "Новости"
    tab_page = MyAdvertsNewsTabPage
  when "IP адреса"
    tab_page = MyAdvertsIPAdressesTabPage
  when "Логи импорта"
    tab_page = MyAdvertsLogImportTabPage
  end
  on tab_page do |page|
    table.hashes.each do |hash|
      page.has_section_displayed(hash['имя секции']).should eq(true), 
        "Отсутствует секция #{hash['имя секции']}"
    end
  end
end

То %{в ЛК ИП на вкладке "Платежи" отображен список платежей} do
  on MyAdvertsPaymentsTabPage do |page|
    page.get_payments_number.should >= 0
  end
end

То %{в ЛК ИП отсутствует пакет "$package"} do |package|
  steps %q{* я перехожу в список моих объявлений}
  on MyAdvertsPage do |page|
    if page.packages?
      page.packages_element.include?(package).should eq(false), 
        "Пакет '#{package}' не был удален"
    else
      puts "Переключателя пакетов не найдено"
    end
  end
end

Допустим %{в ЛК ИП значение поля "$field" равно "$expected"} do |field, expected|
  on PackageInfoPage do |page|
    page.get_field_value(field).should eq(expected)
  end
end

То %{в ЛК ИП присутствует пакет "$package"} do |package|
  steps %q{* я перехожу в список моих объявлений}
  on MyAdvertsPage do |page|
    page.packages_element.include?(package).should eq(true), 
      "Пакет '#{package}' не был добавлен"
  end
end

Допустим /^в ЛК (ИП|ОП) я запоминаю ID последнего активного объявления$/ do |type|
  @class = type == 'ИП' ? MyAdvertsPage : OPAdvertsPage
  on @class do |page|
    @ad_id = page.get_first_active_ad
    puts "ID активного объявления: #{@ad_id}"
  end
end

Допустим %{я жду пока объявление с таким ID проиндексируется за $timeout минут} do |timeout|
  Timeout.timeout(timeout.to_i*60) do
    while true do 
      steps %Q{
        * я ищу "#{@ad_id}"
        * на странице поиска загружен список результатов
      }
      break if @results.size > 0
      sleep 30
    end
  end
end

