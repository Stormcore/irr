# encoding: utf-8
Когда %{на странице поиска загружен список результатов} do 
  on SearchResultsPage do |page| @results = page.search_results end
end

То %{я перехожу на страницу номер $page_number} do |page_number|
  on SearchResultsPage do |page|
    page.go_to_page(page_number)
    @current_page_number = page_number.to_i
  end
end 

То /^на страницe (\d+) я проверяю условия:$/ do |page_number, other_steps|
  on SearchResultsPage do |page|
    if defined?(@current_page_number)
      steps %Q{Then я перехожу на страницу #{page_number}}
    else
      @current_page_number = 1
    end
    steps %Q{#{other_steps}}
  end
end

То /^на страницах (\d+)\-(\d+) я проверяю условия:$/ do |start, finish, other_steps|
  on SearchResultsPage do |page|
    (start..finish).each do |page_number|
      steps %Q{
        Then на страницe #{page_number} я проверяю условия: 
        """
        #{other_steps}
        """
      }
    end
  end
end

То %{правая граница таблицы результатов меньше позиции баннера} do
  on SearchResultsPage do |page|
    table_right = page.table_right_position
    banner_left = page.banner_left_position
    table_right.should be < banner_left
  end
end

То %{на странице показано $operator $number объявлений} do |operator,number|
  on SearchResultsPage do |page| 
    eval "@results.length.should #{operator} #{number}" 
  end
end

То %{сначала отображаются премиум-объявления} do
  premium_section_ended = false
  on SearchResultsPage do |page|
    @results.each do |result|
      current_is_premium = result['premium']
      if premium_section_ended and current_is_premium
        raise "Page #{@current_page_number} Message #{result['url']}: premium message after regular message"
      end
      premium_section_ended = true unless current_is_premium
    end
  end
end

То %{в каждом объявлении присутствует искомое слово} do
  results_page_soft_assert("Нет сниппета в объявлениях:") do |result|
    result.should have_key("snippet")
  end
end

То %{в каждом объявлении указан город "$city"} do |city|
  results_page_soft_assert("Неправильный город:") do |result|
    result['city'].should == city
  end
end

То %{в каждом объявлении не более 120 знаков} do
  results_page_soft_assert("Слишком длинное описание:") do |result|
    result['description'].length.should be < 120
  end
end

То %{в каждом объявлении цена $operator $price} do |operator, price|
  results_page_soft_assert("Некорректная цена:") do |result|
    # Skip premium ads
    unless result['premium']
      eval("result['price'].to_i.should be #{operator} #{price}")
    end
  end
end
 
То %{в каждом объявлении отображается рисунок} do
  results_page_soft_assert("Не отображен рисунок:") do |result|
    thumbnail = result['thumbnail']
    thumbnail.should_not be_empty 
    # Verify that  thumbnail url doesn't throw any error
    url = URI.parse(thumbnail)
    the_request = Net::HTTP::Get.new(url.path)
    the_response = Net::HTTP.start(url.host, url.port) { |http| http.request(the_request) }
    the_response.code.should == 200.to_s
  end
end

То %{в каждом объявлении отображается загруженная фотография} do
  results_page_soft_assert("Не отображена загруженная фотография:") do |result|
    thumbnail = result['thumbnail']
    thumbnail.should_not be_empty 
    thumbnail.should_not include "zaglushka"
    
    # Verify that  thumbnail url doesn't throw any error
    url = URI.parse(thumbnail)
    the_request = Net::HTTP::Get.new(url.path)
    the_response = Net::HTTP.start(url.host, url.port) { |http| http.request(the_request) }
    the_response.code.should == 200.to_s
  end
end

То %{в деталях каждого объявления "$field" $operator "$values"} do |field, operator, expected|
  error_text = "Ошибка проверки деталей объявления: #{field} #{operator} #{expected}"
  results_details_soft_assert(error_text) do |ad_page, result|
      actual_value = ad_page.get_parameter(field)
      case operator
      when "равно"
        expected.should == actual_value
      when "равно одному из"
        expected.split(', ').should include actual_value
      end
  end
end

То %{объявление с заголовком "$header" присутствует на первых $n страницах поиска} do |header, n|
  ad_found = false

  steps %Q{When я ищу "#{header}"}
  on SearchResultsPage do |page|
    unless defined?(@current_page_number)
        @current_page_number = 1
    end
    while @current_page_number < n.to_i
      steps %Q{When на странице поиска загружен список результатов}
      @results.each do |result|
        if result['title'] == header
          puts "Найдено объявление на странице №#{@current_page_number}"
          ad_found = true
          break
        end
      end
      if ad_found
        break
      else
        steps %Q{Then я перехожу на страницу #{@current_page_number+1}}
      end
    end 
    raise "Объявление не найдено" unless ad_found
  end
end

def results_page_soft_assert(description)
  validation_errors = Hash.new
  on SearchResultsPage do |page|
    @results.each do |result|
      begin
        yield result
      rescue RSpec::Expectations::ExpectationNotMetError => verification_error
        page.highlight_result_by_url(result['url'])
        full_url = "http://#{BASE_URL}#{result['url']}"
        validation_errors[full_url] = verification_error
      end
    end
  end

  if !validation_errors.empty?
    puts "URL: #{@browser.url}"
    puts description
    puts validation_errors
    raise "Error occurred on page #{@browser.url}"
  end
end

def results_details_soft_assert(description)
  validation_errors = Hash.new
  on SearchResultsPage do |page|
    @results.each do |result|
      begin
        page.open_ad(result['url'])
        on AdDetailsPage do |ad_page|
          yield ad_page, result
        end
      rescue RSpec::Expectations::ExpectationNotMetError => verification_error
        page.highlight_result_by_url(result['url'])
        full_url = "#{BASE_URL}#{result['url']}"
        validation_errors[full_url] = verification_error.message
      ensure
        @browser.back
      end
    end
  end

  if !validation_errors.empty?
    puts "URL: #{@browser.url}"
    puts description
    puts validation_errors
    raise "Error occurred on page #{@browser.url}"
  end
end
