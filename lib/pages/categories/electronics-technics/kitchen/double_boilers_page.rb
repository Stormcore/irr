# encoding: utf-8

class CategoryElectronicsTechnicsKitchenDoubleBoilersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/double-boilers"
  @category = "Электроника и техника -> Кухонная техника -> Пароварки"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
