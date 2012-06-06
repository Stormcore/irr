# encoding: utf-8

class CategoryFurnitureInteriorRepairPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/repair"
  @category = "Мебель, интерьер, обиход -> Ремонт и сервис"

  irr_multi_select "Тип предложения", "offertype"
end
