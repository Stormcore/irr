# encoding: utf-8

class CategoryRealEstateCommercialsaleHousesPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/commercial-sale/houses"
  @category = "Недвижимость -> Коммерческая. Продажа -> Здания и особняки"

  irr_range_select  "Общая площадь", "meters-total"
  irr_single_select "Ремонт", "state"
  irr_checkbox      "1-я линия", "first-line"
  irr_checkbox      "Парковка", "parking"
end
