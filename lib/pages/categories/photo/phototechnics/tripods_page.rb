# encoding: utf-8

class CategoryPhotoPhototechnicsTripodsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/phototechnics/tripods/"
  @category = "Фото, оптика -> Фототехника -> Штативы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
