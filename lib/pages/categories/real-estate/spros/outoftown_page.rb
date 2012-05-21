# encoding: utf-8

class CategoryRealEstateSprosOutOfTownPage < AdDetailsPage
  include PageObject
  include CityWithMetro
 
  @@url_suffix = "/real-estate/spros/out-of-town"
  @category = "Недвижимость -> Спрос -> Загородная"
  
  irr_single_select "Тип объекта", "out-object"
  irr_checkbox      "В коттеджном поселке", "cottage"
  irr_range_select  "Площадь", "square"

end
