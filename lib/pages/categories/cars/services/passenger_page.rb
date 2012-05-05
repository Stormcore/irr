# encoding: utf-8

class CategoryCarsServicesPassengerPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/passenger"

  def get_parameter (field)
    get_generic_parameter(field) 
  end
end
