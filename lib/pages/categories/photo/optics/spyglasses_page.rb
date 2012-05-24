# encoding: utf-8

class CategoryPhotoOpticsSpyglassesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/optics/spyglasses/"
  @category = "Фото, оптика -> Оптика -> Подзорные трубы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
