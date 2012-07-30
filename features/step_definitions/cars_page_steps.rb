# encoding: utf-8

Когда %{на странице отображен блок "Автосалоны и дилеры"} do
  on CategoryCarsPage do |page|
    lambda {
      page.dealers_section_element.when_present(10).element.visible
    }.should_not raise_error Watir::Wait::TimeoutError
  end
end

Когда %{у каждого дилера отображена эмблема} do
  dealer_info_soft_assert do |dealer|
    response = fetch(dealer.get_thumbnail_url)
    check_http_code(response,
      "Ошибка при получении эмблемы")
    check_size(response,
      "Ошибка при проверке размера эмблемы")
  end
end

Когда %{у каждого дилера отображена активная ссылка} do
  dealer_info_soft_assert do |dealer|
    response = fetch(dealer.get_dealer_url)
    check_http_code(response,
      "Ошибка при проверке ссылки на дилера")
  end
end

То %{в блоке "Автосалоны и дилеры" есть ссылка "Все салоны и дилеры"} do
  on CategoryCarsPage do |page|
    page.all_dealers_element.should be_visible,
      "Ссылка 'Все салоны и дилеры' отсутсвует"
  end
end

То %{в блоке "Автосалоны и дилеры" показан список дилеров} do
  on CategoryCarsPage do |page|
    (page.dealers_element.items > 0).should be_true,
      "Список дилеров пуст"

    # Читаем список дилеров
    @dealers = []
    page.dealers_element.each do |dealer_element|
      @dealers << Dealer.new(dealer_element)
    end
  end
end

То %{для каждой марки и модели я повторяю следующие шаги:} do |stepss|
  marks_and_models_soft_assert do |mark_name, model_name|
    @mark_name = mark_name
    @model_name = model_name
    puts "Running steps"
    steps stepss
  end
end

То %{в поле "Марка" выбрана корректная марка} do
  steps %Q{* в поле "Марка" выбраны следующие значения:
             | value        |
             | #{@mark_name} |}
end

То %{в поле "Модель" выбрана корректная модель} do
  steps %Q{* в поле "Модель" выбраны следующие значения:
             | value         |
             | #{@model_name} |}
end

def fetch(url)
  uri = URI.parse(url)
  req = Net::HTTP::Get.new(uri.path)
  response = Net::HTTP.start(uri.host, uri.port) do |http|
    http.request(req)
  end
  response
end

def check_size(response, description)
  actual_size = response.content_length
  expected_size = 100
  (actual_size > expected_size).should be_true,
    description + ", " +
    "ожидается размер #{expected_size}, " +
    "получен #{actual_size}"
end

def check_http_code(response, description)
  actual_result_code = response.code
  expected_result_codes = %w[200 302]
  expected_result_codes.should include(actual_result_code),
    description + ", " +
    "ожидаются HTTP коды #{expected_result_codes}, " +
    "получен #{actual_result_code}"
end

Допустим /^я перехожу по ссылке для (марки|модели) "(.*?)"$/ do |other, name|
  on CategoryCarsPage do |page|
    page.open_mark_or_model(name)
  end
end

Когда %{заполнена таблица марок и моделей} do
  examples = []
  on CategoryCarsPage do |page|
    page.get_all_marks_or_models.each do |mark_text|
      page.open_mark_or_model(mark_text)
      on CategoryCarsPage do |page1|
        page1.get_all_marks_or_models.each do |model_text|
          examples << "  | #{mark_text} | #{model_text} |"
        end
      end
      @browser.back
    end
  end

  # заменяем examples в текущем сценарии
  scenario_path = File.dirname(__FILE__)+'/../search/cars/popular_marks.feature'
  File.open(scenario_path, "a") do |file|
    file.puts examples.join("\n")
  end
end

Когда /^я заполняю ссылки в секции "(.*?)" с параметрами:$/ do |section, table|
  # Получаем ссылки из облака тегов
  examples = []
  on AdDetailsPage do |page|
    page.get_links_from_section(section).each do |result|
      # Декодируем ссылку
      result[1] = URI.unescape(result[1])
      examples << "  | #{result[0]} | #{result[1]} |"
    end
  end

  scenario_path = File.dirname(__FILE__)+"/../tag_cloud_check.feature"

  # заменяем поля в файле
  text = File.read(scenario_path)
  table.hashes.each do |hash|
    text.gsub!("%#{hash['название']}%", hash['значение'])
  end
  File.open(scenario_path, "w") do |file|
    file.write text
  end

  # заменяем examples в текущем сценарии
  File.open(scenario_path, "a") do |file|
    file.puts examples.join("\n")
  end

end

def dealer_info_soft_assert
  on CategoryCarsPage do |page|
    @dealers.each do |dealer|
      begin
        yield dealer
      rescue RSpec::Expectations::ExpectationNotMetError => verification_error
        dealer_description =
            "#{dealer.get_dealer_name} (#{dealer.get_dealer_url})"
        @validation_errors[dealer_description] =
            verification_error.message
      end
    end
  end
end
