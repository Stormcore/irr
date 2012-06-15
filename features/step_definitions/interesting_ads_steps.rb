# encoding: utf-8

def interesting_ads_soft_assert(description)
  validation_errors = Hash.new
  on InterestingAdsPage do |page|
    page.ads_element.each do |element|
      begin
        ad = InterestingAd.new(element)
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

Когда %{в блоке "Интересные объявления" показаны объявления} do
  on InterestingAdsPage do |page|
    page.interesting_ads_element.when_present.visible?.should == true
  end
end

То %{в блоке "Интересные объявления" показано $number объявлений} do |number|
  on InterestingAdsPage do |page|
    page.get_ads_number.should == number.to_i
  end
end

То %{для каждого объявления в блоке "Интересные объявления" показана фотография} do
  interesting_ads_soft_assert("Не показаны фотографии") do |ad|
    thumbnail = ad.get_photo
    thumbnail.should_not be_empty
    thumbnail.should_not include "zaglushka"
    
    # Verify that  thumbnail url doesn't throw any error
    url = URI.parse(thumbnail)
    the_request = Net::HTTP::Get.new(url.path)
    the_response = Net::HTTP.start(url.host, url.port) { |http| http.request(the_request) }
    the_response.code.should == 200.to_s
  end
end

То %{для каждого объявления в блоке "Интересные объявления" показана цена} do
  interesting_ads_soft_assert("Не показана цена") do |ad|
    ad.get_price.should_not be_nil
  end
end
