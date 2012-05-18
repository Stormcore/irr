# encoding: utf-8

class CategoryElectronicsTechnicsKitchenRefrigeratorsPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/refrigerators"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Вид техники", "refrigerators_type"
  irr_checkbox     "Встраиваемая техника", "fridge_builtin"
  irr_single_select "Количество камер", "refrig_cameras"
end
