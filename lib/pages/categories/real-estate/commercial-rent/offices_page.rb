# encoding: utf-8

class CategoryRealEstateCommercialRentOfficesPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent

  @@url_suffix = "/real-estate/commercial/offices"

  irr_range_select "Общая площадь", "square-min"
  irr_single_select "Ремонт", "state"
  
  irr_checkbox     "1-я линия", "first-line"
  irr_checkbox     "Отдельный вход", "entrance"
  irr_checkbox     "Лифты в здании", "house-lift"
  irr_checkbox     "Охрана здания", "security"
  irr_text_field   "Высота потолков", "house-ceiling-height"
end
