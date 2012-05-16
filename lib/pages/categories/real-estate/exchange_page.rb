# encoding: utf-8

class CategoryRealEstateExchangePage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/exchange"
  
  def set_parameter (hash)
    case hash['parameter']
    when "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      set_metro_parameter(hash)

    else
      super(hash)
    end
  end

  def get_parameter(field)
    case field
    when "АО", "Округ", "Район", "Микрорайон", "Линия метро", "Станция метро", "До метро"
      set_metro_parameter(hash)

    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
