# encoding: utf-8

class CategoryRealEstateCommercialsaleMiscPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/commercial-sale/misc"

  irr_text_field   "Общая площадь", "square-min"
  irr_multi_select "Ремонт", "state"
  irr_checkbox     "1-я линия", "first-line"
  irr_checkbox     "Отдельный вход", "equipment"
end
