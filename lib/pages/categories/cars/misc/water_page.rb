# encoding: utf-8

class CategoryCarsMiscWaterPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/misc/water"

  div :offertype, :xpath => "//div[@data-item-name='offertype']"

  def set_parameter (hash)
    case hash['parameter']

    when "Тип предложения"
      singleselect(self.offertype_element, hash['value'])

    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Тип предложения"
      result = get_unique_parameter(field)
    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
