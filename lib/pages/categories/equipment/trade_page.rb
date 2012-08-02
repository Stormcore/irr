# encoding: utf-8

class CategoryEquipmentTradePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/equipment/trade"
  @category = "Оборудование -> Торговое и холодильное оборудование"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип оборудования", "type"
end
