# encoding: utf-8

class CategoryRealEstateCommercialRentHousesPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent

  @@url_suffix = "/real-estate/commercial/houses"
  @category = "Недвижимость -> Коммерческая. Аренда -> Здания и особняки"

  irr_range_select "Общая площадь", "meters-total"
  irr_single_select "Ремонт", "state"
  irr_checkbox     "1-я линия", "first-line"
  irr_checkbox     "Парковка", "parking"
end
