# encoding: utf-8

class CategoryElectronicsTechnicsClimaticAirPurificationPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/climatic-technics/air-purification-systems"
  @category = "Электроника и техника -> Климатическая техника -> Системы очистки воздуха"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
