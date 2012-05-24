# encoding: utf-8

class CategoryPhotoPhototechnicsFlashesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/phototechnics/flashes/"
  @category = "Телефоны и связь -> Фото, оптика -> Фототехника -> Вспышки"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"

end
