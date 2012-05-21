# encoding: utf-8

class CategoryRealEstateSprosCommercialPage < AdDetailsPage
  include PageObject
  include CityWithMetro
 
  @@url_suffix = "/real-estate/spros/commercial"
  @category = "Недвижимость -> Спрос -> Коммерческая"
  
  irr_single_select "Тип объекта", "commercial-object"
  irr_range_select  "Площадь", "meters-total"

end
