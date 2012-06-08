# encoding: utf-8

def select_class_for_category(category)
  category_pages = AdDetailsPage.subclasses.select do |subclass|
    if subclass.instance_variables.include? :@category
      subclass.instance_variable_get(:@category) == category
    end
  end
  raise "Не найден класс для категории #{category}" if category_pages.length == 0
  @category_page = category_pages[0]
  
end

Когда %{на главной странице я перехожу в категорию "$long_category" через меню} do |long_category|
  # Open category via menu
  long_category.split(' -> ').each_with_index do |category, index|
    if index == 0
      on MainPage do |page|
        page.select_top_category category
      end
    else
      on GenericCategoryPage do |page|
        page.select_sub_category category
      end
    end
  end
  
  select_class_for_category(long_category)
  puts "DEBUG: Страница категории <a href='#{@browser.url}'>#{@browser.url}</a>"
end

Когда %{на главной странице я перехожу в категорию "$long_category"} do |long_category|
  select_class_for_category(long_category)
  ad_class = Kernel.const_get(@category_page.to_s)
  if ad_class.class_variables.include? :@@url_suffix and
     defined?(@url_prefix) and
     defined?(@url_suffix) and
    full_url = @url_prefix+ad_class.class_variable_get("@@url_suffix")+@url_suffix
    puts "DEBUG: URL <a href='#{full_url}'>#{full_url}</a>"
    @browser.goto full_url
  else
    steps %Q{When на главной странице я перехожу в категорию "#{long_category}" через меню}
  end
end

Когда %{я делаю поиск по следующим параметрам:} do |page_params|
  on @category_page do |page|
    page.expand_all_parameters
    page_params.hashes.each do |hash|
      page.set_parameter(hash)
    end
    begin
      page.run_search_element.when_present.click
    rescue Watir::Wait::TimeoutError => e
      puts "ERROR: #{e.message}"
      raise "Отсутствует кнопка 'Показать'"
    end
  end
end

def select_soft_assert_function(option)
  case option
  when "каждого"
    alias soft_assert_function results_details_soft_assert
  when "каждом"
    alias soft_assert_function results_page_soft_assert
  when "первого"
    alias soft_assert_function first_result_details_soft_assert
  when "первом"
    alias soft_assert_function first_result_page_soft_assert
  end
end

То %{в деталях $option объявления отображается видео} do |option|
  # Не проверять источник на *.prontosoft.by
  if BASE_URL.include? 'prontosoft.by'
    puts "Проверка пропущена - тестовый сайт"
    next
  end
  select_soft_assert_function(option)
  soft_assert_function("Видео отсутсвует:") do |ad_page, result|
    ad_page.should have_video, "Видео не показано"
  end
end

То %{в деталях $option объявления присутствует "$parameter"} do |option, parameter|
  select_soft_assert_function(option)
  soft_assert_function("Значение '#{parameter}' не установлено:") do |ad_page, result|
    ad_page.get_parameter(parameter).should be_true, ""
  end
end

То %{в деталях $option объявления "$field" $operator "$values"} do |option, field, operator, expected|
  select_soft_assert_function(option)
  error_text = "Ошибка проверки деталей объявления: #{field} #{operator} #{expected}"
  soft_assert_function(error_text) do |ad_page, result|
      actual_value = ad_page.get_parameter(field)
      case operator
      when "равно одному из"
        expected.split(', ').should include actual_value
      when "равно"
        actual_value.should == expected 
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

То %{на странице категории отображен баннер справа} do
  on GenericCategoryPage do |page|
    (1..3).each do |attempt|
      puts "DEBUG: Attempt #{attempt}"
      break if page.left_banner_element.element.visible?
      @browser.refresh
    end
    page.left_banner_element.should be_visible, "Баннер справа отсуствует"
  end
end

def results_details_soft_assert(description)
  validation_errors = Hash.new
  on SearchResultsPage do |page|
    @results.each do |result|
      begin
        if result and result.has_key?('url') and result.has_key?('title')
          puts "DEBUG: Открываем объявление <a href='#{BASE_URL+result['url']}'>#{result['title']}</a>"
          page.open_ad(result['url'])
          on @category_page do |ad_page|
            yield ad_page, result
          end
        end
      rescue RSpec::Expectations::ExpectationNotMetError => verification_error
        page.highlight_result_by_url(result['url'])
        full_url = BASE_URL+result['url']
        validation_errors[full_url] = verification_error.message
      ensure
        @browser.back
      end
    end
  end

  if !validation_errors.empty?
    output_html_formatted_messages(validation_errors)
    raise "#{description}"
  end
end

def first_result_details_soft_assert(description)
  validation_errors = Hash.new
  on SearchResultsPage do |page|
    # Проверяем только первый результат
    result = @results[0]
    begin
      begin
        if result and result.has_key?('url') and result.has_key?('title')
          puts "DEBUG: Открываем объявление <a href='#{BASE_URL+result['url']}'>#{result['title']}</a>"
          page.open_ad(result['url'])
          on @category_page do |ad_page|
            yield ad_page, result
          end
        end
      rescue RSpec::Expectations::ExpectationNotMetError => verification_error
        full_url = BASE_URL+result['url']
        validation_errors[full_url] = verification_error.message
      end
    end
  end

  if !validation_errors.empty?
    output_html_formatted_messages(validation_errors)
    raise "#{description}"
  end
end

def output_html_formatted_messages(messages)
    messages.each_pair do |url, message|
      puts "<a href='#{url}'>#{url}</a><br><pre>" + message.gsub(/\n/,'<br>') + "</pre>"
    end
end
