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
  @browser.goto(construct_region_url(BASE_URL+"/powerSellers/list/", @region))
end

То %{в списке присутствуют интернет-партнеры} do
  on PowersellersListPage do |page|
    page.get_powerseller_number.should >= 0
  end
end

Допустим %{у каждого интернет-партнера отображается логотип} do
  powersellers_soft_assert("Не показан логотип") do |powerseller|
    puts "Интернет-парнет '#{powerseller.get_name}'"
    next unless powerseller.has_photo
    check_picture_availability powerseller.get_photo
  end
end

Допустим %{я перехожу на страницу интернет-партнера "$name"} do |name|
  full_url = BASE_URL.gsub(/http\:\/\//, "http://#{name}.")
  puts "DEBUG: Переходим на <a href='#{full_url}'>#{full_url}</a>"
  @browser.goto full_url
end

То %{на странице интернет-партнера отображается логотип} do
  on PowersellerPage do |page|
    check_picture_availability page.get_icon
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
    page.get_ads.find{|ad| ad.has_map_badge}.nil? eq(false), 
      "Объявлений с картой не найдено"
  end
end

Допустим %{я открываю первое объявление с картой} do
  on PowersellerPage do |page|
    map_object = page.get_ads.find{|ad| ad.has_map_badge}
    raise "Объявлений с картой не найдено" if map_object.nil?
    href = map_object.get_map_href
    puts "DEBUG: Переходим на <a href='#{href}'>#{href}</a>"
    @browser.goto href
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


