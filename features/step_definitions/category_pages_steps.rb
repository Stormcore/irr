# encoding: utf-8

def select_class_for_category(category)
  case category
  when "Авто и мото -> Выкуп автомобилей. Спрос"
    @category_page = CategoryCarsRepaymentSearchPage

  when "Авто и мото -> Мототехника и Автодома -> Мотоциклы и мопеды"
    @category_page = CategoryCarsMiscMotoPage
    
  when "Авто и мото -> Мототехника и Автодома -> Автодома и легковые прицепы"
    @category_page = CategoryCarsMiscTrailersCaravansWagonsPage
    
  when "Авто и мото -> Мототехника и Автодома -> Снегоходы и квадроциклы"
    @category_page = CategoryCarsMiscSnowPage
    
  when "Авто и мото -> Мототехника и Автодома -> Водный транспорт"
    @category_page = CategoryCarsMiscWaterPage
    
  when "Авто и мото -> Мототехника и Автодома -> Другое"
    @category_page = CategoryCarsMiscOtherPage
    
  when "Авто и мото -> Легковые автомобили -> Автомобили с пробегом"
    @category_page = CategoryCarsPassangerUsedPage
    
  when "Авто и мото -> Легковые автомобили -> Новые автомобили"
    @category_page = CategoryCarsPassangerNewPage
    
  when "Авто и мото -> Автосервис и услуги -> Эскпертиза и оценка"
    @category_page = CategoryCarsServicesEvalutionPage
    
  when "Авто и мото -> Автосервис и услуги -> Ремонт и сервис легковых автомобилей"
    @category_page = CategoryCarsServicesPassengerPage
    
  when "Авто и мото -> Автосервис и услуги -> Ремонт и сервис коммерческого транспорта"
    @category_page = CategoryCarsServicesCommercialPage
    
  when "Авто и мото -> Автосервис и услуги -> Ремонт и сервис мототехники и других видов транспорта"
    @category_page = CategoryCarsServicesMotoPage
    
  when "Авто и мото -> Автосервис и услуги -> Комиссионное оформление и страхование"
    @category_page = CategoryCarsServicesInsurancePage
    
  when "Авто и мото -> Автосервис и услуги -> Кредиты и ссуды"
    @category_page = CategoryCarsServicesLoansPage
    
  when "Авто и мото -> Автосервис и услуги -> Эвакуация и тех. помощь"
    @category_page = CategoryCarsServicesAssistancePage
    
  when "Авто и мото -> Коммерческий транспорт -> Малый коммерческий транспорт"
    @category_page = CategoryCarsCommercialSmallPage
    
  when "Авто и мото -> Коммерческий транспорт -> Средние и тяжелые грузовики"
    @category_page = CategoryCarsCommercialTruckPage
    
  when "Авто и мото -> Коммерческий транспорт -> Грузовые прицепы"
    @category_page = CategoryCarsCommercialTrailersPage
    
  when "Авто и мото -> Коммерческий транспорт -> Автобусы"
    @category_page = CategoryCarsCommercialBusesPage
    
  when "Авто и мото -> Коммерческий транспорт -> Спецтехника"
    @category_page = CategoryCarsCommercialSpecialPage
    
  when "Авто и мото -> Автозапчасти и принадлежности -> Для легковых автомобилей"
    @category_page = CategoryCarsPartsPassengerPage
    
  when "Авто и мото -> Автозапчасти и принадлежности -> Диски"
    @category_page = CategoryCarsPartsDisksPage
    
  when "Авто и мото -> Автозапчасти и принадлежности -> Шины"
    @category_page = CategoryCarsPartsTiresPage
    
  when "Авто и мото -> Автозапчасти и принадлежности -> Колеса"
    @category_page = CategoryCarsPartsWheelsPage
    
  when "Авто и мото -> Автозапчасти и принадлежности -> Для коммерческих автомобилей"
    @category_page = CategoryCarsPartsCommercialPage
    
  when "Авто и мото -> Автозапчасти и принадлежности -> Средства для ухода"
    @category_page = CategoryCarsPartsCareProductsPage
    
  when "Авто и мото -> Автозапчасти и принадлежности -> Для мотоциклов и мопедов"
    @category_page = CategoryCarsPartsMotoPage
    
  when "Авто и мото -> Автозапчасти и принадлежности -> Аудио- и видеотехника"
    @category_page = CategoryCarsPartsAudioPage
    
  when "Авто и мото -> Автозапчасти и принадлежности -> Стекла и оптика"
    @category_page = CategoryCarsPartsOpticsPage
    
  when "Авто и мото -> Автозапчасти и принадлежности -> Аксессуары"
    @category_page = CategoryCarsPartsAccessoriesPage
  end
end

Когда %{на главной странице я перехожу в категорию "$long_category"} do |long_category|
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
end

Когда %{я делаю поиск по следующим параметрам:} do |page_params|
  on @category_page do |page|
    page.expand_all_parameters
    page_params.hashes.each do |hash|
      page.set_parameter(hash)
    end
    page.run_search_element.when_present.click
  end
end

То %{в деталях каждого объявления отображается видео} do 
  results_details_soft_assert("Видео отсутсвует:") do |ad_page, result|
      ad_page.should have_video
  end
end

То %{в деталях каждого объявления "$field" $operator "$values"} do |field, operator, expected|
  error_text = "Ошибка проверки деталей объявления: #{field} #{operator} #{expected}"
  results_details_soft_assert(error_text) do |ad_page, result|
      puts "Страница #{@browser.url}"
      actual_value = ad_page.get_parameter(field)
      case operator
      when "равно"
        actual_value.should == expected 
      when "равно одному из"
        expected.split(', ').should include actual_value
      when "в границах"
        expected_array = expected.split(" - ")
        actual_value.to_i.should be >= expected_array[0].to_i
        actual_value.to_i.should be <= expected_array[1].to_i
      else
        eval("actual_value.to_i.should be #{operator} expected.to_i")
      end
  end
end

def results_details_soft_assert(description)
  validation_errors = Hash.new
  on SearchResultsPage do |page|
    @results.each do |result|
      begin
        page.open_ad(result['url'])
        on @category_page do |ad_page|
          ad_page.show_all_params_element.when_present.click
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