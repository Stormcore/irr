# encoding: utf-8

class CategoryRealEstateCommercialRentHousesPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent

  @@url_suffix = "/real-estate/commercial/houses"

  irr_text_field   "Общая площадь", "meters-total"
  irr_multi_select "Ремонт", "heating"
  irr_checkbox     "1-я линия", "first-line"
  irr_checkbox     "Парковка", "equipment"

  def get_parameter (field)
    case field
    when "Линия метро", "Станция метро", "До метро"
      return get_metro_parameter(field)
    else
      super(field)
    end
  end
end
