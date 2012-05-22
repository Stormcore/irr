# encoding: utf-8

class CategoryElectronicsTechnicsClimaticTermometersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/climatic-technics/thermometers-meteorological-stations"
  @category = "Электроника и техника -> Климатическая техника -> Термометры и метеостанции"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
