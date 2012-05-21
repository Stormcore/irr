# encoding: utf-8

class CategoryElectronicsTechnicsKitchenCoffeeGrindersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/coffee-grinders"
  @category = "Электроника и техника -> Кухонная техника -> Кофемолки"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
