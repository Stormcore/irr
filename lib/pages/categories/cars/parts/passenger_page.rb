# encoding: utf-8

class CategoryCarsPartsPassengerPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/passenger"

  div :make, :xpath => "//div[@data-item-name='make']"

  def set_parameter (hash)
    case hash['parameter']

    when "Марка"
      multiselect(self.make_element, hash['value'])

    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Марка"
      result = get_unique_parameter(field)
    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
