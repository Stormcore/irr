# encoding: utf-8

class CategoryElectronicsTechnicsKitchenMeatGrindersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/meat-grinders"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_checkbox     "Электрическая", "meat_electro"
end
