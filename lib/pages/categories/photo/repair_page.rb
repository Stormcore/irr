# encoding: utf-8

class CategoryPhotoRepairPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/repair"
  @category = "Фото, оптика -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
