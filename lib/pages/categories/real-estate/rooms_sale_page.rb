# encoding: utf-8

class CategoryRealEstateRoomsSalePage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/rooms-sale"

  irr_inline_select "Комнат в квартире", "rooms-for-sale"
  irr_range_select "Общая площадь", "meters-total"
  
  span :show_kitchen_params, :text => 'Квартира'
  irr_range_select "Площадь кухни", "meters-living"
  
  span :show_building_params, :text => 'Здание'
  irr_multi_select "Ремонт", "state"
  irr_checkbox "Отказ получен", "refuse"
  irr_range_select "Этажей в здании", "floor_house"
  irr_checkbox "Лифты в здании", "house-lift"
  irr_checkbox "Газ в доме", "gas"

  def set_parameter (hash)
    self.show_kitchen_params_element.parent.click
    self.show_building_params_element.parent.click
    super(hash)
  end
end
