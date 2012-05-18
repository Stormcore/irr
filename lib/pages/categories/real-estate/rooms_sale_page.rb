# encoding: utf-8

class CategoryRealEstateRoomsSalePage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/rooms-sale"

  irr_inline_select "Количество комнат на продажу", "rooms-for-sale", "Комнат в квартире"
  irr_range_select "Площадь продажи", "meters-total", "Общая площадь"
  
  span :show_building_params, :text => 'Здание'
  irr_single_select "Ремонт", "state"
  irr_checkbox "Отказ получен", "refuse"
  irr_range_select "Этажей в здании", "etage-all"
  irr_checkbox "Лифты в здании", "house-lift"
  irr_checkbox "Газ в доме", "gas"

  def set_parameter (hash)
    self.show_building_params_element.parent.click
    super(hash)
  end
end
