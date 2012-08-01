# encoding: utf-8

class CategoryElectronicsTechnicsKitchenBreadOvenPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/bread-oven"
  @category = "Электроника и техника -> Кухонная техника -> Хлебопечки"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
