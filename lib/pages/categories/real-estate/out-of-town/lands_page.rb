# encoding: utf-8

class CategoryRealEstateOutoftownLandsPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/out-of-town/lands"
  @category = "Недвижимость -> Дома, дачи, участки. Продажа -> Участки"

  irr_single_select  "Категория земли", "land_purpose"
  irr_single_select  "Вид разрешенного использования", "land_usage"
  irr_single_select  "Вид права", "land_law"
  irr_checkbox       "Газ", "gas"
  irr_checkbox       "Электричество", "electricpower"
  irr_range_select   "Площадь участка", "land"

end
