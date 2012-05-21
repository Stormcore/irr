# encoding: utf-8

class CategoryElectronicsTechnicsKitchenToastersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/toasters"
  @category = "Электроника и техника -> Кухонная техника -> Тостеры"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
