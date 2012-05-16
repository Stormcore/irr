# encoding: utf-8

class CategoryCarsServicesPassengerPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/passenger"

  alias get_parameter get_generic_parameter

end
