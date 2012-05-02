# encoding: utf-8

class CategoryCarsPartsWheelsPage < AdDetailsPage
  include PageObject
  div :offertype, :xpath => "//div[@data-item-name='offertype']"
  div :condition_c, :xpath => "//div[@data-item-name='condition_c']"

  def set_parameter (hash)
    case hash['parameter']

    when "Тип предложения"
      multiselect(self.offertype_element, hash['value'])

    when "Состояние"
      multiselect(self.condition_c_element, hash['value'])

    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Тип предложения", "Состояние"
      get_unique_parameter(field)
    else
      get_generic_parameter(field)
    end 
  end
end