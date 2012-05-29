# encoding: utf-8

class CategoryEquipmentFoodPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/equipment/food"
  @category = "Оборудование -> Пищевое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип оборудования", "type"
end
