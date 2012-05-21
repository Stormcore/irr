# encoding: utf-8

class CategoryElectronicsTechnicsKitchenCombinesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/combines"
  @category = "Электроника и техника -> Кухонная техника -> Кухонные комбайны"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
