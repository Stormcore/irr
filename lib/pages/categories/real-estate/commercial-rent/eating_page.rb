# encoding: utf-8

class CategoryRealEstateCommercialRentEatingPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent

  @@url_suffix = "/real-estate/commercial/eating"

  irr_text_field "Общая площадь", "meters-total"
  irr_text_field "Площадь зала", "square-hall"
  irr_checkbox "Отдельный вход", "entrance"
  irr_checkbox "1-я линия", "first-line"
  irr_checkbox "Оборудование", "equipment"

  irr_multi_select "Система отопления", "heating"
  irr_multi_select "Система водоснабжения", "water"

  def get_parameter (field)
    case field
    when "Линия метро", "Станция метро", "До метро"
      return get_metro_parameter(field)
    else
      super(field)
    end
  end
end
