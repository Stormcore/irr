# encoding: utf-8

Допустим /^открыт список объявлений для категории "(.*?)"$/ do |category|
  on MainPage do |page|
    page.open_ad_list category
  end
  @current_page = 1
end

Когда /^на странице фильтров я делаю поиск по параметрам:$/ do |table|
  # table is a Cucumber::Ast::Table

  table.hashes.each do |hash|
    on SearchResultsPage do |page|
      page.set_filter_parameter(hash)
    end
    if hash['поле'] == 'Регион'
      on RegionSelectPage do |page|
        page.select_region hash['значение']
      end
    end
  end

  on SearchResultsPage do |page|
    page.do_search
  end
end

То /^на странице результатов показано >= (\d+) объявлений$/ do |num|
  on SearchResultsPage do |page|
    page.get_results_size.should >= num.to_i
  end
end

Допустим /^у каждого объявления на странице "(.*?)" (равно|в границах) "(.*?)"$/ do |key, clause, expected|
  results_soft_assert do |ad|
    actual = ad.get_parameter(key)
    case clause
    when "равно"
      actual.should eq(expected)
    when "в границах"
      actual_min = actual.split(' - ')[0]
      actual_max = actual.split(' - ')[1]
      actual_min.to_i.should >= expected.to_i
      actual_max.to_i.should <= expected.to_i
    end
  end
end

Допустим /^в деталях каждого объявления на странице "(.*?)" равно "(.*?)"$/ do |key, expected|
  result_details_soft_assert do |ad|
    ad.get_value(key).should eq(expected)
  end
end

Допустим /^у каждого объявления на странице присутствует фотография$/ do
  result_details_soft_assert do |ad|
    ad.has_photo?.should eq(true)
  end
end

Допустим /^я перехожу на страницу №(\d+)$/ do |page_num|
  unless @current_page == page_num.to_i
    on SearchResultsPage do |page|
      page.switch_to_page page_num.to_i
    end
    @current_page = page_num.to_i
  end
end

def results_soft_assert
  # Запоминаем оригинальный url, чтоб вернуться на него
  original_url = @browser.url

  errors = {}
  on SearchResultsPage do |page|
    results = page.get_results
    puts "Список URL: #{results.map{|r| r.get_url}}"
    page.get_results.each do |ad|
      begin
        yield ad
      rescue Exception => e
        errors[ad.get_url] = e.message
      end
    end
  end

  if errors.size > 0
    @browser.goto original_url
    errors.each_pair do |url, message|
      puts "<a href='#{url}'>#{url}</a><br><pre>" + message.gsub(/\n/,'<br>') + "</pre>"
    end
    raise "Ошибка"
  end
end

def result_details_soft_assert
  # Запоминаем оригинальный url, чтоб вернуться на него
  original_url = @browser.url

  errors = {}
  results = []
  on SearchResultsPage do |page|
    results = page.get_results
  end

  puts "Список URL: #{results.map{|r| r.get_url}}"

  results.each do |ad|
    begin
      url = ad.get_url
      @browser.goto url
      on AdDetailsPage do |page|
        yield page
      end
    rescue Exception => e
      errors[url] = e.message
    end
  end

  if errors.size > 0
    @browser.goto original_url
    errors.each_pair do |url, message|
      puts "<a href='#{url}'>#{url}</a><br><pre>" + message.gsub(/\n/,'<br>') + "</pre>"
    end
    raise "Ошибка"
  end
end
