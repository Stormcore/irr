# encoding: utf-8

class CategoryElectronicsTechnicsKitchenScalesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/scales"
  @category = "Электроника и техника -> Кухонная техника -> Кухонные весы"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
