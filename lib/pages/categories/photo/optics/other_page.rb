# encoding: utf-8

class CategoryPhotoOpticsOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/optics/other/"
  @category = "Телефоны и связь -> Фото, оптика -> Оптика -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
