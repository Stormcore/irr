# encoding: utf-8

class CategoryCarsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars"
  @category = "Авто и мото"

  # Дилеры
  div :dealers_section, :class => "b-dillers"
  unordered_list :dealers, :xpath => "//div[@class='b-blockInf b-dillers']/div[@class='b-body']/ul"
  link :all_dealers, :xpath => "//div[@class='b-blockInf b-dillers']/div[@class='b-body']/div[@class='b-bottom']/a"

  # Популярные марки
  div :popular_marks, class: "b-popularMark"

  # Параметры поиска
  irr_range_select "Год выпуска", "car-year"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_multi_select "Тип кузова", "bodytype"

  #Этого селекта нет, но он требуется для теста облака тегов "Двигатели"
  irr_multi_select "Тип двигателя", "turbo"

  def get_all_marks_or_models
    self.popular_marks_element.when_present.div_element(id: "short_items_list").
         element.as.collect{|link| link.text}
  end

  def open_mark_or_model(name)
    self.link_element(text: name).click
  end

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
