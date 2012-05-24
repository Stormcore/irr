# encoding: utf-8

class CategoryPhotoPhototechnicsFilmPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/phototechnics/film/"
  @category = "Телефоны и связь -> Фото, оптика -> Фототехника -> Фотоаппараты пленочные"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"

end
