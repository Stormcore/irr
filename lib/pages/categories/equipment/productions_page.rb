# encoding: utf-8

class CategoryEquipmentProductionsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/equipment/productions"
  @category = "Оборудование -> Производственно-техническое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип оборудования", "type"
end
