# encoding: utf-8

class CategoryComputerDevicesPDAsPDAPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/pdas_communicators/"

  div :offertype, :xpath => "//div[@data-item-name='offertype']"
  div :used_or_new, :xpath => "//div[@data-item-name='used-or-new']"
  div :make, :xpath => "//div[@data-item-name='make']"
  div :os, :xpath => "//div[@data-item-name='os']"
  checkbox :wifi, :name => "wifi"
  checkbox :gps, :name => "gps"

  def set_parameter (hash)
    case hash['parameter']

    when "Тип предложения"
      multiselect(self.offertype_element, hash['value'])

    when "Состояние"
      multiselect(self.used_or_new_element, hash['value'])

    when "Марка"
      multiselect(self.make_element, hash['value'])
      
    when "Тип ОС"
      singleselect(self.os_element, hash['value'])

    when "Wi-Fi"
      self.wifi_element.check

    when "GPS"
      self.gps_element.check

    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    case field
    when "Новый или подержанный", "Тип предложения", "Марка"
      result = get_unique_parameter(field)
    when "Wi-Fi", "GPS"
      result = get_checkbox_parameter(field)
    else
      result = get_generic_parameter(field) 
    end
    result
  end
end
