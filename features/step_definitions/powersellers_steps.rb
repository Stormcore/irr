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
        page.highlight_result_by_url(result['url'])
        full_url = "#{BASE_URL}#{result['url']}"
        validation_errors[full_url] = verification_error.message
      end
    end
  end

  if !validation_errors.empty?
    output_html_formatted_messages(validation_errors)
    raise "#{description}"
  end
end

Когда %{я перехожу на страницу списка интернет-партнеров} do
  visit PowersellersListPage
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
    thumbnail = powerseller.get_photo
    thumbnail.should_not be_empty
    thumbnail.should_not include "zaglushka"
    
    # Verify that  thumbnail url doesn't throw any error
    url = URI.parse(thumbnail)
    the_request = Net::HTTP::Get.new(url.path)
    the_response = Net::HTTP.start(url.host, url.port) { |http| http.request(the_request) }
    the_response.code.should == 200.to_s
  end
end

