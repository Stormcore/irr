# encoding: utf-8

class CategoryRealEstateRentPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent

  @@url_suffix = "/real-estate/rent"
  @category = "Недвижимость -> Квартиры. аренда"

  irr_inline_select "Комнат в квартире", "rooms"
  irr_range_select "Общая площадь", "meters-total"
  
  span :show_kitchen_params, :text => 'Площадь Жилая/Кухня'
  irr_range_select "Жилая площадь", "meters-living"
  irr_range_select "Площадь кухни", "kitchen"
  
  irr_multi_select "Этаж", "floor_house"
  irr_single_select "Ремонт", "state"
  irr_checkbox     "Телефон", "telephone"
  irr_checkbox     "Мебель", "furniture"
  irr_checkbox     "Бытовая техника", "household"
  irr_range_select "Этаж в здании", "etage-all"
  irr_checkbox     "Лифты в здании", "house-lift"
  irr_checkbox     "Газ в доме", "gas"
  
  def set_parameter (hash)
    self.show_kitchen_params_element.parent.click
    super(hash)
  end
end
