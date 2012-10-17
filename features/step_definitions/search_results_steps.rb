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

Когда /^я вижу на странице результатов >= (\d+) объявлений$/ do |num|
  on SearchResultsPage do |page|
    page.get_results_size.should >= num.to_i
  end
end

Когда /^я перехожу на (\d+) страницу результатов$/ do |num|
  on SearchResultsPage do |page|
    page.open_paginated_result_page num.to_s
  end
end

Когда /^я изменяю количество отображаемых объявлений на (\d+)$/ do |num|
  on SearchResultsPage do |page|
    page.change_result_length_to num.to_s
  end
end

То /^на странице результатов показано >= (\d+) объявлений$/ do |num|
  on SearchResultsPage do |page|
    page.get_results_size.should >= num.to_i
  end
end

То /^на странице результатов показано >= (\d+) дилера$/ do |num|
  on SearchCompaniesResultsPage do |page|
    page.get_results_size.should >= num.to_i
  end
end


То /^значения фильтра имеют вид:$/ do |table|
  table.hashes.each do |hash|
    on SearchResultsPage do |page|
      page.get_filter_parameter(hash).should be_true
    end
    #реализовать проверку региона
    #if hash['поле'] == 'Регион'
    #  on RegionSelectPage do |page|
    #    page.select_region hash['значение']
    #  end
    #end
  end
end

Допустим /^в деталях каждого дилера "(.*?)" (равно|в границах|равно одному из) "(.*?)"$/ do |key, clause, expected|
  dealers_details_soft_assert do |ad|
    actual = ad.get_parameter(key)
    case clause
    when "равно"
      actual.should eq(expected)
    when "в границах"
      expected_min = expected.split(' - ')[0]
      expected_max = expected.split(' - ')[1]
      actual.to_i.should >= expected_min.to_i
      actual.to_i.should <= expected_max.to_i
    when "одному из"
      expecteds = expected.split("; ")
      expecteds.should include actual
    end
  end
end

Допустим /^у каждого дилера "(.*?)" >= (\d+)$/ do |key, expected|
  dealers_soft_assert do |ad|
    ad.get_parameter(key).to_i.should >= expected.to_i
  end
end

Допустим /^у каждого объявления на странице "(.*?)" (равно|в границах|равно одному из) "(.*?)"$/ do |key, clause, expected|
  results_soft_assert do |ad|
    actual = ad.get_parameter(key)
    case clause
    when "равно"
      actual.should eq(expected)
    when "в границах"
      expected_min = expected.split(' - ')[0]
      expected_max = expected.split(' - ')[1]
      actual.to_i.should >= expected_min.to_i
      actual.to_i.should <= expected_max.to_i
    when "одному из"
      expecteds = expected.split("; ")
      expecteds.should include actual
    end
  end
end

Допустим /^в деталях каждого объявления на странице:$/ do |table|
  result_details_soft_assert do |ad|
    table.hashes.each do |hash|
      ad.get_value(hash['поле']).should eq(hash['значение'])
    end
  end
end

Допустим /^в деталях каждого объявления на странице "(.*?)" (равно|в границах|равно одному из) "(.*?)"$/ do |key, clause,expected|
  result_details_soft_assert do |ad|
    actual = ad.get_value key
    case clause
    when "равно"
      actual.should eq(expected)
    when "в границах"
      expected_min = expected.split(' - ')[0]
      expected_max = expected.split(' - ')[1]
      actual.to_i.should >= expected_min.to_i
      actual.to_i.should <= expected_max.to_i
    when "одному из"
      expecteds = expected.split("; ")
      expecteds.should include actual
    end
  end
end

Допустим /^у каждого объявления на странице присутствует фотография$/ do
  results_soft_assert do |ad|
    image = ad.get_photo_url
    image.empty?.should eq(false)
  end
end

Допустим /^я переключаюсь на вид "(.*)"$/ do |view|
  on SearchResultsPage do |page|
    page.switch_to_view view
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
    # Cтрочку puts источник ошибки показывает криво
    # Поэтому заполняем место комментариями
    raise "Ошибка"
  end
end

def dealers_soft_assert
  # Запоминаем оригинальный url, чтоб вернуться на него
  original_url = @browser.url

  errors = {}
  on SearchCompaniesResultsPage do |page|
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
    # Cтрочку puts источник ошибки показывает криво
    # Поэтому заполняем место комментариями
    raise "Ошибка"
  end
end

def result_details_soft_assert
  # Запоминаем оригинальный url, чтоб вернутся на него
  original_url = @browser.url

  errors = {}
  urls = []
  on SearchResultsPage do |page|
    urls = page.get_results.map{|r| r.get_url}
  end

  urls.each do |url|
    begin
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
    # Cтрочку puts источник ошибки показывает криво
    # Поэтому заполняем место комментариями
    raise "Ошибка"
  end
end

def dealers_details_soft_assert
  # Запоминаем оригинальный url, чтоб вернутся на него
  original_url = @browser.url

  errors = {}
  urls = []
  on SearchCompaniesResultsPage do |page|
    urls = page.get_results.map{|r| r.get_url}
  end

  urls.each do |url|
    begin
      @browser.goto url
      on DealerDetailsPage do |page|
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
    # Cтрочку puts источник ошибки показывает криво
    # Поэтому заполняем место комментариями
    raise "Ошибка"
  end
end
