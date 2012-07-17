# encoding: utf-8

class CategoryRealEstateCommercialsaleOfficesPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/commercial-sale/offices"
  @category = "Недвижимость -> Коммерческая. Продажа -> Офисы"

  irr_range_select "Общая площадь", "square-min"
  irr_single_select "Ремонт", "state"
  
  irr_checkbox     "1-я линия", "first-line"
  irr_checkbox     "Отдельный вход", "entrance"
  irr_checkbox     "Лифты в здании", "house-lift"
  irr_checkbox     "Охрана здания", "security"
  irr_text_field   "Высота потолков", "house-ceiling-height"
end
