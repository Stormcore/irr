# encoding: utf-8

class CategoryPhotoOpticsAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/optics/accessories/"
  @category = "Телефоны и связь -> Фото, оптика -> Оптика -> Аксессуары"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
