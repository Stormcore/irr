# encoding: utf-8

class CategoryGardenEquipmentOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/equipment/other"
  @category = "Все для дачи -> Садовая техника -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"

end
