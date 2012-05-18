# encoding: utf-8

class CategoryRealEstateSprosLivePage < AdDetailsPage
  include PageObject
  include CityWithMetro
 
  @@url_suffix = "/real-estate/spros/live"
  
  irr_single_select "Тип объекта", "apartments-object"
  irr_range_select  "Комнат в квартире", "rooms"
  irr_range_select  "Площадь", "meters-total"

end
