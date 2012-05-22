# encoding: utf-8

class CategoryElectronicsTechnicsClimaticWaterHeatersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/climatic-technics/water-heaters"
  @category = "Электроника и техника -> Климатическая техника -> Водонагреватели"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
