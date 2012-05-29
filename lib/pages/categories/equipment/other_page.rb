# encoding: utf-8

class CategoryEquipmentOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/equipment/other"
  @category = "Оборудование -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
