# encoding: utf-8

class CategoryPhotoOpticsBinocularsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/optics/binoculars/"
  @category = "Фото, оптика -> Оптика -> Бинокли"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
