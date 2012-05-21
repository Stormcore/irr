# encoding: utf-8

class CategoryElectronicsTechnicsKitchenCoffeeMakersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/coffee-makers"
  @category = "Электроника и техника -> Кухонная техника -> Кофеварки и кофемашины"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
