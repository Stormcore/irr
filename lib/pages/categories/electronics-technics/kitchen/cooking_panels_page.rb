# encoding: utf-8

class CategoryElectronicsTechnicsKitchenCookingPanelsPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/cooking-panels"
  @category = "Электроника и техника -> Кухонная техника -> Плиты и варочные панели"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип плиты", "plit_type"
  irr_checkbox     "Встраиваемая техника", "fridge_builtin"
end
