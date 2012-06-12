# encoding: utf-8

class CategoryCarsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars"
  @category = "Авто и мото"

  # Дилеры
  div :dealers_section, :class => "b-dillers"
  unordered_list :dealers, :xpath => "//div[@class='b-blockInf b-dillers']/div[@class='b-body']/ul"
  link :all_dealers, :xpath => "//div[@class='b-blockInf b-dillers']/div[@class='b-body']/div[@class='b-bottom']/a"

  # Параметры поиска
  irr_range_select "Год выпуска", "car-year"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_multi_select "Тип кузова", "bodytype"

end

class Dealer
  def initialize(element)
    @element = element.div_element(:class => "wrap").
      div_element(:class => "hid-o")
  end

  def get_thumbnail_url
    @element.div_element(:class => "wrImage").
      image_element.attribute("src")
  end

  def get_dealer_name
    @element.paragraph_element(:class => "h3").
      link_element.text
  end

  def get_dealer_url
    @element.paragraph_element(:class => "h3").
      link_element.attribute("href")
  end
end
