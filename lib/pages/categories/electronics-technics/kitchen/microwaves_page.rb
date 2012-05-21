# encoding: utf-8

class CategoryElectronicsTechnicsKitchenMicrowavesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/microwaves"
  @category = "Электроника и техника -> Кухонная техника -> Микроволновые печи"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_checkbox     "Встраиваемая техника", "fridge_builtin"
  irr_checkbox     "Гриль", "mikrovoln_grill"
end
