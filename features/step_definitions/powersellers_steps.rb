# encoding: utf-8

def powersellers_soft_assert(description)
  validation_errors = Hash.new
  on PowersellersListPage do |page|
    first = true
    page.powersellers_element.each do |element|
      begin
        if first # Пропускаем первый элемент - это заголовок
          first = false
          next
        end
        ad = Powerseller.new(element)
        yield ad
      rescue RSpec::Expectations::ExpectationNotMetError => verification_error
        validation_errors[@browser.url] = verification_error.message
      end
    end
  end

  if !validation_errors.empty?
    output_html_formatted_messages(validation_errors)
    raise "#{description}"
  end
end

Когда %{я перехожу на страницу списка интернет-партнеров} do
  visit PowersellersListPage
end

То %{в списке присутствуют интернет-партнеры} do
  on PowersellersListPage do |page|
    page.get_powerseller_number.should >= 0
  end
end

Допустим %{у каждого интернет-партнера отображается логотип} do
  if BASE_URL.include? "prontosoft.by"
    puts "Пропускаем проверку картинки - тестовый сервер"
    next
  end
  powersellers_soft_assert("Не показан логотип") do |powerseller|
    puts "Интернет-парнет '#{powerseller.get_name}'"
    next unless powerseller.has_photo
    thumbnail = powerseller.get_photo
    thumbnail.should_not be_empty
    thumbnail.should_not include "zaglushka"
    
    # Verify that  thumbnail url doesn't throw any error
    url = URI.parse(thumbnail)
    the_request = Net::HTTP::Get.new(url.path)
    the_response = Net::HTTP.start(url.host, url.port) { |http| http.request(the_request) }
    the_response.code.should == 200.to_s
  end
end

Допустим %{я перехожу на страницу интернет-партнера "$name"} do |name|
  @browser.goto BASE_URL.gsub(/http\:\/\//, "http://#{name}.")
end

То %{на странице интернет-партнера отображается логотип} do
  if BASE_URL.include? "prontosoft.by"
    puts "Пропускаем проверку картинки - тестовый сервер"
    next
  end
  on PowersellerPage do |page|
    thumbnail = page.get_icon
    thumbnail.should_not be_empty
    thumbnail.should_not include "zaglushka"
    
    # Verify that  thumbnail url doesn't throw any error
    url = URI.parse(thumbnail)
    the_request = Net::HTTP::Get.new(url.path)
    the_response = Net::HTTP.start(url.host, url.port) { |http| http.request(the_request) }
    the_response.code.should == 200.to_s
  end
end

Когда %{на странице интернет-партнера отображается секция "Разделы"} do
  on PowersellerPage do |page|
    page.get_categories_size.should >= 0
  end
end

Когда %{на странице интернет-партнера отображается секция "Все объявления"} do
  on PowersellerPage do |page|
    page.get_ads_size.should >= 0
  end
end

То %{на странице интернет-партнера в разделе "$category" значение счетчика равно "$counter"} do |category, counter|
  on PowersellerPage do |page|
    page.get_category_by_name(category).ads_count.to_i.should == counter.to_i
  end
end

То %{на странице интернет-партнера общее количество объявлений в разделах равно "$counter"} do |counter|
  on PowersellerPage do |page|
    page.get_total_categories_count.to_i.should == counter.to_i
  end
end

То %{на странице интернет-партнера количество премиумов равно $number} do |number|
  on PowersellerPage do |page|
    page.get_ads_size(type="premium").to_i.should == number.to_i
  end
end

Допустим %{на странице интернет-партнера количество обычных объявлений равно $number} do |number|
  on PowersellerPage do |page|
    page.get_ads_size(type="default").to_i.should == number.to_i
  end
end

Допустим %{на странице интернет-партнера есть объявления с картой} do
  on PowersellerPage do |page|
    page.get_ads.select{|ad| ad.has_map_badge}.size > 0
  end
end

Допустим %{я открываю первое объявление с картой} do
  on PowersellerPage do |page|
    map_object = page.get_ads.select{|ad| ad.has_map_badge}
    raise "Объявлений с картой не найдено" unless map_object
    @browser.goto map_object[0].get_map_href
  end
end

То %{на странице объявления открыта секция "$section"} do |section|
  on AdDetailsPage do |page|
    page.get_active_tab == "На карте"
  end
end

Допустим %{на странице объявления я открываю вкладку "$section"} do |section|
  on AdDetailsPage do |page|
    page.switch_to_tab section
  end
end

Допустим %{на странице объявления открыта карта} do
  on AdDetailsPage do |page|
    page.map_displayed.should == true
  end
end


