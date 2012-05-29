# encoding: utf-8

class CategoryEquipmentBuildingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/equipment/building"
  @category = "Оборудование -> Строительное и ремонтное"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип оборудования", "type"
end
