# encoding: utf-8

class CategoryPhotoPhototechnicsAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/phototechnics/accessories/"
  @category = "Телефоны и связь -> Фото, оптика -> Фототехника -> Аксессуары"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
