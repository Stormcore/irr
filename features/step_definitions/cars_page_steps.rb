# encoding: utf-8

Когда %{на странице отображен блок "Автосалоны и дилеры"} do
  on CategoryCarsPage do |page|
    page.dealers_section_element.should be_visible
  end
end

Когда %{у каждого дилера отображена эмблема} do
  dealer_info_soft_assert do |dealer|
    check_http_code(dealer.get_thumbnail_url,
      "Ошибка при проверке эмблемы")
  end
end

Когда %{у каждого дилера отображена активная ссылка} do
  dealer_info_soft_assert do |dealer|
    check_http_code(dealer.get_dealer_url,
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

def check_http_code(url, description)
  uri = URI.parse(url)
  req = Net::HTTP::Get.new(uri.path)
  response = Net::HTTP.start(uri.host, uri.port) do |http|
    http.request(req)
  end
  actual_result_code = response.code
  expected_result_codes = %w[200 302]
  expected_result_codes.should include(actual_result_code),
    description + ", " +
    "ожидаются HTTP коды #{expected_result_codes}, " +
    "получен #{actual_result_code}"
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
