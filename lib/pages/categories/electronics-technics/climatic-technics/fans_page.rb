# encoding: utf-8

class CategoryElectronicsTechnicsClimaticFansPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/climatic-technics/fans"
  @category = "Электроника и техника -> Климатическая техника -> Вентиляторы"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип вентилятора", "fan_type"
end
