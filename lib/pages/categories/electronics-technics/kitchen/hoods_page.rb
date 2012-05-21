# encoding: utf-8

class CategoryElectronicsTechnicsKitchenHoodsPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/hoods"
  @category = "Электроника и техника -> Кухонная техника -> Вытяжки"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
