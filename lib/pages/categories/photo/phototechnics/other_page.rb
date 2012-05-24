# encoding: utf-8

class CategoryPhotoPhototechnicsOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/phototechnics/other/"
  @category = "Телефоны и связь -> Фото, оптика -> Фототехника -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
