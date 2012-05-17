# encoding: utf-8

class CategoryRealEstateCommercialsaleHousesPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/commercial-sale/houses"

  irr_text_field   "Общая площадь", "meters-total"
  irr_multi_select "Ремонт", "state"
  irr_checkbox     "1-я линия", "first-line"
  irr_checkbox     "Парковка", "parking"
end
