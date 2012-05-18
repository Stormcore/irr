# encoding: utf-8

def select_class_for_category(category)
  case category
  when "Авто и мото"
    @category_page = CategoryCarsPage
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
    @category_page = CategoryCarsServicesEvaluationPage
    
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
    
  when "Авто и мото -> Автосервис и услуги -> Экспертиза и оценка"
    @category_page = CategoryCarsServicesEvaluationPage
    
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
    
  when "Недвижимость -> Квартиры. Продажа -> Новостройки"
    @category_page = CategoryRealEstateApartmentsSaleNewPage

  when "Недвижимость -> Квартиры. Продажа -> Вторичный рынок"
    @category_page = CategoryRealEstateApartmentsSaleSecondaryPage

  when "Недвижимость -> Квартиры. Аренда"
    @category_page = CategoryRealEstateRentPage

  when "Недвижимость -> Комнаты и доли. Продажа"
    @category_page = CategoryRealEstateRoomsSalePage

  when "Недвижимость -> Комнаты. Аренда"
    @category_page = CategoryRealEstateRoomsRentPage

  when "Недвижимость -> Дома, дачи и участки. Продажа -> Дома, дачи"
    @category_page = CategoryRealEstateOutoftownHousesPage

  when "Недвижимость -> Дома, дачи и участки. Продажа -> Участки"
    @category_page = CategoryRealEstateOutoftownLandsPage

  when "Недвижимость -> Дома, дачи и участки. Продажа -> Коттеджные поселки"
    @category_page = CategoryRealEstateOutoftownCottagePage
    
  when "Недвижимость -> Дома, дачи. Аренда"
    @category_page = CategoryRealEstateOutoftownRentPage

  when "Недвижимость -> Коммерческая. Продажа -> Офисы"
    @category_page = CategoryRealEstateCommercialsaleOfficesPage

  when "Недвижимость -> Коммерческая. Продажа -> Торговля и сервис"
    @category_page = CategoryRealEstateCommercialsaleRetailPage

  when "Недвижимость -> Коммерческая. Продажа -> Производство и склады"
    @category_page = CategoryRealEstateCommercialsaleProductionWarehousesPage

  when "Недвижимость -> Коммерческая. Продажа -> Кафе. Бары. Рестораны"
    @category_page = CategoryRealEstateCommercialsaleEatingPage

  when "Недвижимость -> Коммерческая. Продажа -> Здания и особняки"
    @category_page = CategoryRealEstateCommercialsaleHousesPage

  when "Недвижимость -> Коммерческая. Продажа -> Другие и свободного назначения"
    @category_page = CategoryRealEstateCommercialsaleMiscPage

  when "Недвижимость -> Коммерческая. Аренда -> Офисы"
    @category_page = CategoryRealEstateCommercialRentOfficesPage

  when "Недвижимость -> Коммерческая. Аренда -> Торговля и сервис"
    @category_page = CategoryRealEstateCommercialRentRetailPage

  when "Недвижимость -> Коммерческая. Аренда -> Производство и склады"
    @category_page = CategoryRealEstateCommercialRentProductionWarehousesPage

  when "Недвижимость -> Коммерческая. Аренда -> Кафе. Бары. Рестораны"
    @category_page = CategoryRealEstateCommercialRentEatingPage

  when "Недвижимость -> Коммерческая. Аренда -> Здания и особняки"
    @category_page = CategoryRealEstateCommercialRentHousesPage

  when "Недвижимость -> Коммерческая. Аренда -> Другие и свободного назначения"
    @category_page = CategoryRealEstateCommercialRentMiscPage

  when "Недвижимость -> Гаражи и стоянки. Продажа -> Машиноместо"
    @category_page = CategoryRealEstateGarageParkingPage

  when "Недвижимость -> Гаражи и стоянки. Продажа -> Гаражи и боксы"
    @category_page = CategoryRealEstateGarageStallPage

  when "Недвижимость -> Гаражи и стоянки. Аренда -> Машиноместо"
    @category_page = CategoryRealEstateGarageRentParkinglPage

  when "Недвижимость -> Гаражи и стоянки. Аренда -> Гаражи и боксы"
    @category_page = CategoryRealEstateGarageRentStallPage

  when "Недвижимость -> Спрос -> Жилая"
    @category_page = CategoryRealEstateSprosLivePage

  when "Недвижимость -> Спрос -> Гаражи и стоянки"
    @category_page = CategoryRealEstateSprosGaragePage

  when "Недвижимость -> Спрос -> Коммерческая"
    @category_page = CategoryRealEstateSprosCommercialPage

  when "Недвижимость -> Спрос -> Загородная"
    @category_page = CategoryRealEstateSprosOutOfTownPage

  when "Недвижимость -> Услуги"
    @category_page = CategoryRealEstateServicesPage

  when "Недвижимость -> Обмен"
    @category_page = CategoryRealEstateExchangePage

  when "Недвижимость -> Другое"
    @category_page = CategoryRealEstateOtherPage

  when "Компьютерная техника -> Ноутбуки -> Ноутбуки"
    @category_page = CategoryComputerDevicesNotebooksNotebooksPage

  when "Компьютерная техника -> Ноутбуки -> Нетбуки и UMPC"
    @category_page = CategoryComputerDevicesNotebooksNetbooksUMPCPage
    
  when "Компьютерная техника -> Ноутбуки -> Сумки и кейсы для ноутбуков"
    @category_page = CategoryComputerDevicesNotebooksCasesPage

  when "Компьютерная техника -> Ноутбуки -> Аксессуары"
    @category_page = CategoryComputerDevicesNotebooksAccessoriesPage

  when "Компьютерная техника -> Настольные компьютеры"
    @category_page = CategoryComputerDevicesDesktopsPage

  when "Компьютерная техника -> КПК -> КПК"
    @category_page = CategoryComputerDevicesPDAsPDAPage
  end
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
  puts "DEBUG: Страница категории #{@browser.url}"
end

Когда %{на главной странице я перехожу в категорию "$long_category"} do |long_category|
  select_class_for_category(long_category)
  ad_class = Kernel.const_get(@category_page.to_s)
  if ad_class.class_variables.include? :@@url_suffix and
     defined?(@url_prefix) and
     defined?(@url_suffix) and
    full_url = @url_prefix+ad_class.class_variable_get("@@url_suffix")+@url_suffix
    puts "DEBUG: URL #{full_url}"
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
    page.run_search_element.when_present.click
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
      puts "DEBUG: Страница #{@browser.url}"
      $stdout.flush
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

То %{на странице категории отображен баннер справа} do
  on GenericCategoryPage do |page|
    (1..3).each do |attempt|
      puts "DEBUG: Attempt #{attempt}"
      $stdout.flush
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
        if result and result.has_key?('url')
          page.open_ad(result['url'])
          on @category_page do |ad_page|
            yield ad_page, result
          end
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
    $stdout.flush
    raise "Error occurred on page #{@browser.url}"
  end
end

def first_result_details_soft_assert(description)
  validation_errors = Hash.new
  on SearchResultsPage do |page|
    # Проверяем только первый результат
    result = @results[0]
    begin
      begin
        if result and result.has_key?('url')
          page.open_ad(result['url'])
          on @category_page do |ad_page|
            yield ad_page, result
          end
        end
      rescue RSpec::Expectations::ExpectationNotMetError => verification_error
        page.highlight_result_by_url(result['url'])
        full_url = "#{BASE_URL}#{result['url']}"
        validation_errors[full_url] = verification_error.message
      end
    end
  end

  if !validation_errors.empty?
    puts "URL: #{@browser.url}"
    puts description
    puts validation_errors
    $stdout.flush
    raise "Error occurred on page #{@browser.url}"
  end
end
