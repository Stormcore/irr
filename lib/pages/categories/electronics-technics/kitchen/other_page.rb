# encoding: utf-8

class CategoryElectronicsTechnicsKitchenOtherPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/other"
  @category = "Электроника и техника -> Кухонная техника -> Прочее"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
