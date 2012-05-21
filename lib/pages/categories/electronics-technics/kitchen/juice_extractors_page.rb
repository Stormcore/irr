# encoding: utf-8

class CategoryElectronicsTechnicsKitchenJuiceExtractorsPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/juice-extractors"
  @category = "Электроника и техника -> Кухонная техника -> Соковыжималки"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
