# encoding: utf-8

class CategoryRealEstateCommercialsaleMiscPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/commercial-sale/misc"

  irr_range_select  "Общая площадь", "square-min"
  irr_single_select "Ремонт", "state"
  irr_checkbox      "1-я линия", "first-line"
  irr_checkbox      "Отдельный вход", "entrance"
end
