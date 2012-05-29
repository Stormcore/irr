# encoding: utf-8

class CategoryEquipmentTradePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/equipment/trade"
  @category = "Оборудование -> Для торговли и услуг"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип оборудования", "type"
end
