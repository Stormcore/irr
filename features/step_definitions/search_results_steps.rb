# encoding: utf-8

Когда %{на странице поиска загружен список результатов} do 
  on SearchResultsPage do |page| 
    @results = page.search_results
  end
end

Когда %{на странице поиска загружен список результатов для недвижимости} do
  on SearchResultsForRealEstatePage do |page| 
    @results = page.search_results
  end
end

Когда %{на странице поиска я переключаю "Объявлений на странице" на $number} do |number|
  on SearchResultsPage do |page| 
    page.show_more_ads(number)
  end
  steps %Q{* на странице поиска загружен список результатов}
end

Когда /^на странице поиска я запоминаю следующие поля из деталей объявления:$/ do |table|
  steps %Q{
    * на странице поиска я переключаю "Объявлений на странице" на 80
    * на странице поиска загружен список результатов
  }
  @result_details = Hash.new
  on SearchResultsPage do |page|
    @results.each do |result|
      begin
        puts "DEBUG: Переходим на <a href='#{result['url']}'>#{result['url']}</a>"
        @browser.goto(result['url'])
        @result_details[result['url']] = Hash.new
        on @category_page do |page|
          table.hashes.each do |hash|
            parameter_name = hash['поле']
            @result_details[result['url']][parameter_name] = page.get_parameter(parameter_name)
          end
        end
      rescue
      end
    end
  end
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

То %{на странице показано $operator $number объявлени(е|й|я)} do |operator,number,other|
  on SearchResultsPage do |page|
    unless @sc.source_tag_names.include?('@empty_results') and @results.length == 0
      eval "@results.length.should #{operator} #{number}"
    else
      puts "У сценария указан тег @empty_results, пропускаем проверку"
    end
  end
end

То %{сначала отображаются премиум-объявления} do
  premium_section_ended = false
  on SearchResultsPage do |page|
    @results.each do |result|
      current_is_premium = result['premium']
      if premium_section_ended and current_is_premium
        raise "Страница #{@current_page_number}, объявление #{result['url']}: премиум после обычного сообщения"
      end
      premium_section_ended = true unless current_is_premium
    end
  end
end

То %{в каждом объявлении присутствует искомое слово} do
  # TODO: хотя бы один присуствует (если есть отдельное слово в тексте)
  results_page_soft_assert("Нет сниппета в объявлениях:") do |result|
    if result['description'].match /\b#{@keywords}/
      result.should have_key("snippet")
    else
      result.should_not have_key("snippet")
    end
  end
end

То %{в каждом объявлении указан город "$city"} do |city|
  results_page_soft_assert("Неправильный город:") do |result|
    result['city'].should == city
  end
end

То %{в каждом объявлении не более $n знаков} do |n|
  results_page_soft_assert("Слишком длинное описание:") do |result|
    length = result['description'].length
    if length > n.to_i
      # Описание показывается до конца слова
      # Ищем пробел или знак препинания до конца строки начиная с позиции n
      # Если он найден - то строка не обрезана
      result['description'][n.to_i..-1].should_not match(/\s/), 
        "Слишком длинное описание (#{length} символов, остаток слова '#{result['description'][n.to_i..-1]}')"
    end
  end
end

То /^в каждом объявлении (цена|зарплата) (.+) (\d+)$/ do |other, operator, price|
  results_page_soft_assert("Некорректная цена:") do |result|
    # Пропускаем премиумы
    unless result['premium']
      eval("result['price'].to_i.should be #{operator} #{price}")
    end
  end
end

То %{в каждом объявлении срок сдачи равен "$parameter"} do |parameter|
  results_page_soft_assert("Неправильный срок сдачи:") do |result|
    result['time'].should eql("в #{parameter}")
  end
end

То %{в каждом объявлении валюта равна "$price"} do |currency|
  results_page_soft_assert("Некорректная валюта:") do |result|
    result['currency'].should be == currency
  end
end
 
То %{в каждом объявлении отображается рисунок} do
  # Не проверять картинки на *.prontosoft.by
  if BASE_URL.include? 'prontosoft.by'
    puts "Проверка пропущена - тестовый сайт"
    next
  end
  results_page_soft_assert("Не отображен рисунок:") do |result|
    thumbnail = result['thumbnail']
    thumbnail.should_not be_nil
    
    # Verify that  thumbnail url doesn't throw any error
    url = URI.parse(thumbnail)
    the_request = Net::HTTP::Get.new(url.path)
    the_response = Net::HTTP.start(url.host, url.port) { |http| http.request(the_request) }
    the_response.code.should == 200.to_s
  end
end

То %{каждое объявление подано не более $max_days дней назад} do |max_days|
  results_page_soft_assert("Неправильное время подачи:") do |result|
    if result['date']
      date_diff = (Time.now.to_date - result['date'])
      date_diff.to_i.should be <= max_days.to_i
    end
  end
end

То %{в каждом объявлении источник равен "$expected_source"} do |expected_source|
  # Не проверять источник на *.prontosoft.by
  if BASE_URL.include? 'prontosoft.by'
    puts "Проверка пропущена - тестовый сайт"
    next
  end
  results_page_soft_assert("Неправильный источник:") do |result|
    actual_source = result['source_title']
    if result['source_link'].nil?
      actual_source = "Интернет-партнёры"
    else
      actual_source = "Сайт IRR.RU" if result['source_link'].include? "user"
      actual_source = "Интернет-партнёры" if result['source_link'].include? BASE_URL.gsub("http://","")
    end
    actual_source.should be == expected_source
  end
end

То %{в каждом объявлении отображается загруженная фотография} do
  # Не проверять картинки на *.prontosoft.by
  if BASE_URL.include? 'prontosoft.by'
    puts "Проверка пропущена - тестовый сайт"
    next
  end
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

То %{в заголовке каждого объявления содержится "$keywords"} do |keywords|
  steps %Q{Then в заголовке каждого объявления содержится одно из "#{keywords}"}
end

То %{в заголовке каждого объявления содержится одно из "$keywords"} do |keywords|
  results_page_soft_assert("Нет ключевых слов в названии:") do |result|
    keyword_found = false
    keywords.split(", ").each do |keyword|
      if UnicodeUtils.downcase(result['title']).include? UnicodeUtils.downcase(keyword)
        puts "URL #{result['url']}: найдено ключевое слово #{keyword}"
        keyword_found = true
        break
      end
    end
    unless keyword_found
      raise RSpec::Expectations::ExpectationNotMetError, "Ключевое слово не найдено в заголовке '#{result['title']}'"
    end
  end
end

То %{в $option объявлении содержится "$keywords"} do |option, keywords|
  steps %Q{Then в #{option} объявлении содержится одно из "#{keywords}"}
end

То %{в $option объявлении содержится одно из "$keyword"} do |option, keywords|
  select_soft_assert_function(option)
  soft_assert_function("Нет ключевого слова в объявлении") do |result|
    next if result.nil?
  
    keyword_found = false
    # Проверяем результаты поиск
    keywords.split(", ").each do |keyword|
      downcased_keyword = UnicodeUtils.downcase(keyword)
      # Заголовок
      if result['title']
        if UnicodeUtils.downcase(result['title']).include? downcased_keyword
          puts "URL <a href='#{result['url']}'>#{result['title']}</a>':" +
               " найдено ключевое слово '#{keyword}' в заголовке"
          keyword_found = true
         break
        end
      end
      
      # Текст объявления на странице
      next if result['description'].nil?
      if UnicodeUtils.downcase(result['description']).include? downcased_keyword
        puts "URL <a href='#{result['url']}'>#{result['title']}</a>':" +
             " найдено ключевое слово '#{keyword}' в тексте на странице поиска"
        keyword_found = true
        break
      end
    end

    # Если не нашли объявление нигде раньше, то ищем в деталях объявления
    unless keyword_found
      puts "DEBUG: Переходим на <a href='#{result['url']}'>#{result['url']}</a>"
      @browser.goto(result['url'])
      on AdDetailsPage do |page|
        keywords.split(", ").each do |keyword|
          downcased_keyword = UnicodeUtils.downcase(keyword)

          # Полный текст объявления
          begin
            page.advert_text_element.when_present
            if UnicodeUtils.downcase(page.advert_text_element.text).include? downcased_keyword
              puts "URL <a href='#{result['url']}'>#{result['title']}</a>':" +
                   " найдено ключевое слово '#{keyword}' в полном тексте объявления"
              keyword_found = true
              break
            end
          rescue
          end

          # Текст основных параметров
          begin
            page.main_params_element.when_present
            if UnicodeUtils.downcase(page.main_params_element.element.html).include? downcased_keyword
              puts "URL <a href='#{result['url']}'>#{result['title']}</a>':" +
                   " найдено ключевое слово в основных параметрах объявления"
              keyword_found = true
              break
            end
          rescue
          end

          page.show_all_params if page.show_all_params_element.exists?
          # Текст всех параметров
          begin
            page.all_params_element.when_present
            if UnicodeUtils.downcase(page.all_params_element.element.html).include? downcased_keyword
              puts "URL <a href='#{result['url']}'>#{result['title']}</a>':" +
                   " найдено ключевое слово во всех параметрах объявления"
              keyword_found = true
              break
            end
          rescue
          end
        end
      end
      @browser.back
    end

    raise RSpec::Expectations::ExpectationNotMetError, "Не найдено ключевое слово" unless keyword_found
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

Допустим %{первым в списке обычных объявлений первым идёт объявление "$expected_title"} do |expected_title|
  # Ищем первое обычное объявление
  ad_found = false
  on SearchResultsPage do |page|
    @results.each do |result|
      unless result['premium']
        result['title'].should == expected_title
        ad_found = true
        break
      end
    end
  end
  ad_found.should eq(true), "Поднятое объявление не показано в списке"
end

То %{в списке обычных объявлений объявление "$title" выделено} do |title|
  on SearchResultsPage do |page|
    ad = @results.find{|result| result['title'] == title}
    ad.nil?.should eq(false), "Объявление '#{title}' отсутствует в листинге"
    ad['mark'].should eq(true), 
      "Объявление '<a href='#{ad['url']}'>#{title}</a>' не выделено"
  end
end

То %{в списке обычных объявлений присутствует объявление "$title"} do |title|
  on SearchResultsPage do |page|
    ad = @results.find{|result| result['title'] == title}
    ad.nil?.should eq(false), "Объявление '#{title}' отсутствует в листинге"
    ad['premium'].should eq(false), 
      "Объявление '#{title}' (#{ad['url']}) является премиумом"
  end
end

То %{в списке объявлений отсутствует объявление "$title"} do |title|
  on SearchResultsPage do |page|
    ad = @results.find{|result| result['title'] == title}
    ad.nil?.should eq(true), "Объявление '#{title}' присутствует в листинге"
  end
end

То %{у объявления "$title" отображается загруженная фотография} do |title|
  # Не проверять картинки на *.prontosoft.by
  if BASE_URL.include? 'prontosoft.by'
    puts "Проверка пропущена - тестовый сайт"
    next
  end
  on SearchResultsPage do |page|
    result = @results.find{|result| result['title'] == title}
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

То %{в списке премиумов присутствует объявление "$title"} do |title|
  on SearchResultsPage do |page|
    ad = @results.find{|result| result['title'] == title}
    ad.nil?.should eq(false), "Объявление '#{title}' отсутствует в листинге"
    ad['premium'].should eq(true), 
      "Объявление '<a href='#{ad['url']}'>#{title}</a>' не является премиумом"
  end
end

Допустим /^на странице поиска показаны только объявления:$/ do |table|
  on SearchResultsPage do |page|
    @results.size.should eq(table.hashes.size)
    expected = table.hashes.map{|h| h['название']}.sort
    actual = @results.map{|r| r['title']}.sort
    actual.should == expected
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

def first_result_page_soft_assert(description)
  validation_errors = Hash.new
  on SearchResultsPage do |page|
    result = @results[0]
    begin
      yield result
    rescue Exception => verification_error
      page.highlight_result_by_url(result['url'])
      validation_errors[result['url']] = verification_error.message
    end
  end

  if !validation_errors.empty?
    output_html_formatted_messages(validation_errors)
    raise "#{description}"
  end
end

def results_page_soft_assert(description)
  validation_errors = Hash.new
  on SearchResultsPage do |page|
    @results.each do |result|
      begin
        yield result
      rescue Exception => verification_error
        page.highlight_result_by_url(result['url'])
        validation_errors[result['url']] = verification_error.message
      end
    end
  end

  if !validation_errors.empty?
    output_html_formatted_messages(validation_errors)
    raise "#{description}"
  end
end
