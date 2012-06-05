# encoding: utf-8

class CategoryPhotoRepairPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/repair"
  @category = "Фото, оптика -> Ремонт и сервис"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Тип товара", "used-or-new"
end
