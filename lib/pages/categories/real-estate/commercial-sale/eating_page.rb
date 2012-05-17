# encoding: utf-8

class CategoryRealEstateCommercialsaleEatingPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/commercial-sale/eating"

  irr_text_field "Общая площадь", "meters-total"
  irr_text_field "Площадь зала", "square-hall"
  irr_checkbox "Отдельный вход", "entrance"
  irr_checkbox "1-я линия", "first-line"
  irr_checkbox "Оборудование", "equipment"

  irr_multi_select "Система отопления", "heating"
  irr_multi_select "Система водоснабжения", "water"

end
