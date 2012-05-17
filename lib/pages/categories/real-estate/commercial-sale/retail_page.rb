# encoding: utf-8

class CategoryRealEstateCommercialsaleRetailPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/commercial-sale/retail"

  irr_single_select "Назначение помещения", "trading_purpose"
  irr_single_select "Ремонт", "state"
  irr_range_select  "Общая площадь", "square-min"
  
  irr_checkbox      "1-я линия", "first-line"
  irr_checkbox      "Отдельный вход", "entrance"
  irr_text_field    "Высота потолков", "house-ceiling-height"
end
