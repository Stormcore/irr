# encoding: utf-8

class CategoryPhotoOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/other"
  @category = "Фото, оптика -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
