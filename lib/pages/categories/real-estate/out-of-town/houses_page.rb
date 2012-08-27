# encoding: utf-8

class CategoryRealEstateOutoftownHousesPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  
  @@url_suffix = "/real-estate/out-of-town/houses"
  @category = "Недвижимость -> Дома, дачи, участки. Продажа -> Дома, дачи"

  irr_range_select  "Площадь строения", "meters-total"
  irr_range_select  "Год постройки/сдачи", "house-year"
  irr_range_select  "Площадь участка", "land"
  irr_range_select  "Количество этажей", "etage-all"
  irr_inline_select "Количество комнат", "rooms"
  irr_checkbox      "Газ в доме", "gas"
  irr_checkbox      "Отапливаемый", "heating1"
  irr_single_select "Материал стен", "walltype"
  irr_multi_select  "Строение", "object"
  irr_single_select  "Ремонт", "state"
end
