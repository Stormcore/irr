# encoding: utf-8

class CategoryComputerDevicesDesktopsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/notebooks/netbooks_umpc/"

  div :offertype, :xpath => "//div[@data-item-name='offertype']"
  div :used_or_new, :xpath => "//div[@data-item-name='used-or-new']"

  def set_parameter (hash)
    case hash['parameter']

    when "Тип предложения"
      multiselect(self.offertype_element, hash['value'])

    when "Состояние"
      multiselect(self.used_or_new_element, hash['value'])

    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Новый или подержанный", "Тип предложения"
      result = get_unique_parameter(field)
    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
