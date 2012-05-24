# encoding: utf-8

class CategoryPhotoPhototechnicsFramesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/phototechnics/frames/"
  @category = "Фото, оптика -> Фототехника -> Фоторамки"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
