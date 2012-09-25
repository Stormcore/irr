# encoding: utf-8

def interesting_ads_soft_assert(description)
  validation_errors = Hash.new
  @interesting_ads.each do |element|
    begin
      yield element
    rescue RSpec::Expectations::ExpectationNotMetError, RuntimeError => verification_error
      validation_errors[element.get_url] = verification_error.message
    end
  end

  if !validation_errors.empty?
    output_html_formatted_messages(validation_errors)
    raise "#{description}"
  end
end

Когда %{в блоке "Интересные объявления" показаны объявления} do
  @interesting_ads = []
  on InterestingAdsPage do |page|
    page.interesting_ads_element.visible?.should eq(true), 
        "Отсутствует секция 'Интересные объявления'"
    page.ads_element.each do |element|
      ad = InterestingAd.new(element)
      @interesting_ads << ad
    end
  end
end

То %{в блоке "Интересные объявления" показано $operator $number объявлений} do |operator, number|
  on InterestingAdsPage do |page|
    eval("page.get_ads_number.should #{operator} #{number}")
  end
end

То %{для каждого объявления в блоке "Интересные объявления" показана фотография} do
  interesting_ads_soft_assert("Не показаны фотографии") do |ad|
    thumbnail = ad.get_photo
    next if thumbnail.include? "prontosoft.by"
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

То %{в деталях каждого объявления в блоке "Интересные объявления" "$field" $operator "$expected"} do |field, operator, expected|
  interesting_ads_soft_assert("Неправильное значение #{field}") do |ad|
    @browser.goto(ad.get_url)
    steps %Q{* на вкладке "Все" "#{field}" #{operator} "#{expected}"}
  end
end

То %{каждое объявление в блоке "Интересные объявления" является премиумом} do
  interesting_ads_soft_assert("Объявление не является премиумом") do |ad|
    @ad_id = ad.get_id
    steps %Q{
      * я перехожу на БО
      * на БО я перехожу в категорию "Объявления -> Найти объявления"
      * я делаю поиск по созданному объявлению
    }
    on StargateAdSearchResultsPage do |page|
      page.open_menu(0)
      page.menu_edit
    end

    on StargateAdDetailsDialog do |page|
      page.is_premium?.should eq(true), "Объявление #{@ad_id} не премиум"
    end
  end
end
