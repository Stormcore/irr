# encoding: utf-8

class CategoryElectronicsTechnicsKitchenElectroGrillsPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/electrogrills"
  @category = "Электроника и техника -> Кухонная техника -> Электрогрили"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
