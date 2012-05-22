# encoding: utf-8

class CategoryElectronicsTechnicsClimaticAirConditioningPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/climatic-technics/air-conditioning"
  @category = "Электроника и техника -> Климатическая техника -> Кондиционеры"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
