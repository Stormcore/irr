# encoding: utf-8

class CategoryRealEstateCommercialRentOfficesPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent

  @@url_suffix = "/real-estate/commercial/offices"

  irr_text_field   "Общая площадь", "square-min"
  irr_multi_select "Назначение помещения", "heating"
  
  irr_checkbox     "1-я линия", "first-line"
  irr_checkbox     "Отдельный вход", "equipment"
  irr_checkbox     "Лифты в здании", "house-lift"
  irr_checkbox     "Охрана здания", "security"
  irr_text_field   "Высота потолков", "house-ceiling-height"
  text_field :house_ceiling_height, :name => ""

  def get_parameter (field)
    case field
    when "Линия метро", "Станция метро", "До метро"
      return get_metro_parameter(field)
    else
      super(field)
    end
  end
end
