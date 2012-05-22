# encoding: utf-8

class CategoryElectronicsTechnicsClimaticHeaterDevicesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/climatic-technics/heater-devices"
  @category = "Электроника и техника -> Климатическая техника -> Обогревательные приборы"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
