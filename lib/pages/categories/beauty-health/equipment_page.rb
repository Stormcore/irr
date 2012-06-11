# encoding: utf-8

class CategoryBeautyHealthEquipmentPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/beauty-health/equipment"
  @category = "Здоровье и красота -> Оснащение"

  irr_multi_select "Тип предложения", "offertype"
end
