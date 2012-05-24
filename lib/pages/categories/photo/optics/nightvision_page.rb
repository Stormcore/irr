# encoding: utf-8

class CategoryPhotoOpticsNightvisionPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/optics/nightvision/"
  @category = "Фото, оптика -> Оптика -> Приборы ночного видения"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
