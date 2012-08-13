# encoding: utf-8
Когда %{в ЛК ИП открыт список объявлений пользователя} do
  on MyAdvertsPage do |page|
    page.wait_for_ads_loaded
  end
end

Когда %{в ЛК ОП открыт список объявлений пользователя} do
  on OPAdvertsPage do |page|
    page.wait_for_ads_loaded
  end
end

Когда %{в ЛК ОП объявление с названием "$title" присутствует в списке} do |title|
  on OPAdvertsPage do |page|
    @ad_element = page.get_ad_with_title(title)
    @ad_id = @ad_element.get_ad_id
    puts "Найдено объявление <a href='#{@ad_element.get_url_for_ad}'>#{title}</a>, ID: #{@ad_id}"
  end
end

Когда %{в ЛК ИП объявление с названием "$title" присутствует в списке} do |title|
  on MyAdvertsPage do |page|
    @ad_element = page.get_ad_with_title(title)
    @ad_id = @ad_element.get_ad_id
    puts "Найдено объявление <a href='#{@ad_element.get_url_for_ad}'>#{title}</a>, ID: #{@ad_id}"
  end
end

Когда %{в ЛК ИП объявление с названием "$title" отсутствует в списке} do |title|
  on MyAdvertsPage do |page|
    lambda {page.get_ad_with_title(title)}.should raise_error,
      "Объявление '#{title}' присутствует в списке"
  end
end

Когда %{в ЛК ОП объявление с названием "$title" отсутствует в списке} do |title|
  on OPAdvertsPage do |page|
    lambda {page.get_ad_with_title(title)}.should raise_error,
      "Объявление '#{title}' присутствует в списке"
  end
end

Допустим %{в ЛК ИП я удаляю все объявления} do
  on MyAdvertsPage do |page|
    page.delete_all_ads
  end
end

То %{у объявления указан регион "$region"} do |region|
  @ad_element.get_region.should == region
end

То %{у объявления указан город "$city"} do |city|
  @ad_element.get_city.should == city
end

То %{у объявления указана цена "$price" в $currency} do |price, currency|
  case currency
  when "рублях"
    @ad_element.get_price("RUR").gsub(/руб./, '').should == price
  when "долларах"
    @ad_element.get_price("USD").gsub(/\$/, '').should == price
  when "евро"
    @ad_element.get_price("EUR").gsub(/€/, '').should == price
  end
end

Допустим %{у объявления отображается загруженная фотография} do
  if BASE_URL.include? 'prontosoft.by'
    puts "Проверка пропущена - тестовый сайт"
    next
  end
  thumbnail = @ad_element.get_photo
  thumbnail.should_not be_nil
  
  # Verify that  thumbnail url doesn't throw any error
  url = URI.parse(thumbnail)
  the_request = Net::HTTP::Get.new(url.path)
  the_response = Net::HTTP.start(url.host, url.port) { |http| http.request(the_request) }
  the_response.code.should == 200.to_s
end

Допустим %{статус созданного объявления равен "$expected"} do |expected|
  @ad_element.moderation_status.should == expected
end

Допустим %{дополнительный статус созданного объявления равен "$expected"} do |expected|
  @ad_element.moderation_additional_status.should == expected
end

Когда %{я открываю детали этого объявления} do
  url = @ad_element.get_url_for_ad
  puts "Открываю объявление <a href=#{url}>#{url}</a>"
  @ad_element.open_ad
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
    table.hashes.each do |hash|
      begin
        steps %Q{* на вкладке "Все" "#{hash['поле']}" равно "#{hash['значение']}"}
      rescue Exception => e
        errors[hash['поле']] = e.message
      end
    end
  end
  if errors.size > 0
    errors.each {|error| puts error }
    raise "Найдены ошибки при проверке деталей"
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
  if BASE_URL.include? 'prontosoft.by'
    puts "Проверка пропущена - тестовый сайт"
    next
  end
  on AdDetailsPage do |page|
    thumbnail = page.get_photo
    thumbnail.should_not be_nil
    
    # Verify that  thumbnail url doesn't throw any error
    url = URI.parse(thumbnail)
    the_request = Net::HTTP::Get.new(url.path)
    the_response = Net::HTTP.start(url.host, url.port) { |http| http.request(the_request) }
    the_response.code.should == 200.to_s
  end
end

То %{в деталях объявления отображается загруженное видео} do
  on AdDetailsPage do |page|
    page.should have_video, "Видео отсутствует"
  end
end

Когда %{я редактирую данное объявление} do
  @ad_element.do_action("Редактировать")
end

Когда %{я размещаю данное объявление} do
  @ad_element.do_place
end

Допустим %{я поднимаю данное объявление} do
  @ad_element.do_action("Поднять")

  on AdvertActionConfirmPage do |page|
    page.do_activate
  end
end

Допустим %{я делаю данное объявление премиумом} do
  @ad_element.do_action("Премиум")

  on AdvertActionConfirmPage do |page|
    page.do_activate
  end
end

Допустим %{я выделяю данное объявление} do
  @ad_element.do_action("Выделить")

  on AdvertActionConfirmPage do |page|
    page.do_activate
  end
end

Допустим %{я деактивирую данное объявление} do
  @ad_element.do_action("Деактивировать")
  @browser.alert.ok
end

Допустим %{я удаляю данное объявление} do
  @ad_element.do_action("Удалить")
  @browser.alert.ok
end

Допустим %{в ЛК данное объявление выделено} do
  @ad_element.is_ad_highlighted.should == true
end

Допустим %{в ЛК данное объявление является премиумом} do
  @ad_element.is_ad_premium.should == true
end

Допустим %{в ЛК ИП я выбираю регион "$region"} do |region|
  on MyAdvertsPage do |page|
    page.select_region(region)
  end
end

Допустим %{в ЛК ИП я выбираю пакет "$package"} do |package|
  on PackageInfoPage do |page|
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

  puts "DEBUG: Страница <a href='#{@browser.url}>#{@browser.url}</a>, номер '#{@number}' текст '#{@text}'"

  on SMSDebugPage do |page|
    page.send_sms(@number, @text)
  end

  on SMSDebugResponse do |page|
    page.get_response.should include("Спасибо")
  end
end

Допустим %{я отсылаю SMS для оплаты используя казахский сендер} do
  visit SMSDebugKZPage

  puts "DEBUG: Страница <a href='#{@browser.url}>#{@browser.url}</a>, номер '#{@number}' текст '#{@text}'"

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
  steps %q{* в ЛК ИП я перехожу в список моих объявлений}
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
  steps %q{* в ЛК ИП я перехожу в список моих объявлений}
  on MyAdvertsPage do |page|
    page.packages_element.include?(package).should eq(true), 
      "Пакет '#{package}' не был добавлен"
  end
end

Допустим %{в ЛК ИП я запоминаю ID последнего объявления} do
  on MyAdvertsPage do |page|
    @ad_id = page.get_first_ad.get_ad_id
  end
end

Допустим %{в ЛК ОП я запоминаю ID последнего объявления} do
  on MyAdvertsPage do |page|
    @ad_id = page.get_first_ad.get_ad_id
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

