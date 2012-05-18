# encoding: utf-8

class CategoryRealEstateCommercialRentEatingPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent

  @@url_suffix = "/real-estate/commercial/eating"

  irr_range_select "Общая площадь", "meters-total"
  irr_range_select "Площадь зала", "square-hall"
  irr_checkbox "Отдельный вход", "entrance"
  irr_checkbox "1-я линия", "first-line"
  irr_checkbox "Оборудование", "equipment"

  irr_single_select "Система отопления", "heating"
  irr_single_select "Система водоснабжения", "water"
end
