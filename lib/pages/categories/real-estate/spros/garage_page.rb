# encoding: utf-8

class CategoryRealEstateSprosGaragePage < AdDetailsPage
  include PageObject
  include CityWithMetro
 
  @@url_suffix = "/real-estate/spros/garage"
  @category = "Недвижимость -> Спрос -> Гаражи и стоянки"
  
  irr_multi_select  "Тип предложения", "offertype"
  irr_single_select "Тип объекта", "garage-type"

end
