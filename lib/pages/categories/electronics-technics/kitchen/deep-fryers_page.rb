# encoding: utf-8

class CategoryElectronicsTechnicsKitchenDeepFryersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/deep-fryers"
  @category = "Электроника и техника -> Кухонная техника -> Фритюрницы"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
