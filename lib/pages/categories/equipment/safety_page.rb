# encoding: utf-8

class CategoryEquipmentSafetyPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/equipment/safety"
  @category = "Оборудование -> Системы охраны и безопасности"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип оборудования", "type"
end
