# encoding: utf-8

class CategoryRealEstateRoomsRentPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent

  @@url_suffix = "/real-estate/rooms-rent"
  @category = "Недвижимость -> Комнаты. Аренда"

  irr_inline_select "Комнат сдается", "roomsForRent"
  
  span :show_kitchen_params, :text => 'Квартира'
  irr_range_select "Площадь арендуемой комнаты", "meters-living"
  
  span :show_building_params, :text => 'Здание'
  irr_multi_select "Этаж", "floor_house"
  irr_single_select "Ремонт", "state"
  irr_checkbox "Мебель", "furniture"
  irr_checkbox "Бытовая техника", "household"
  irr_range_select "Этаж в здании", "etage-all"
  irr_checkbox "Лифты в здании", "house-lift"
  irr_checkbox "Газ в доме", "gas"

  def set_parameter (hash)
    self.show_building_params_element.parent.click
    super(hash)
  end
end
