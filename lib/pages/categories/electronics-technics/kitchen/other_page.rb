# encoding: utf-8

class CategoryElectronicsTechnicsKitchenOtherPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/other"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
