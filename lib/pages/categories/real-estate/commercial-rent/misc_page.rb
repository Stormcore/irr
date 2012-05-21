# encoding: utf-8

class CategoryRealEstateCommercialRentMiscPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent

  @@url_suffix = "/real-estate/commercial/misc"
  @category = "Недвижимость -> Коммерческая. Аренда -> Другие и свободного назначения"

  irr_range_select  "Общая площадь", "square-min"
  irr_single_select "Ремонт", "state"
  irr_checkbox      "1-я линия", "first-line"
  irr_checkbox      "Отдельный вход", "entrance"
end
