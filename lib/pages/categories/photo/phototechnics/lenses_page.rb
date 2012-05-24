# encoding: utf-8

class CategoryPhotoPhototechnicsLensesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/phototechnics/lenses/"
  @category = "Телефоны и связь -> Фото, оптика -> Фототехника -> Объективы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
