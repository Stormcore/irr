# encoding: utf-8

class CategoryCarsServicesPassengerPage < AdDetailsPage
  include PageObject
  @@getter_functions = Hash.new
  @@setter_functions = Hash.new
  @@url_suffix = "/cars/services/passenger"

  alias get_parameter get_generic_parameter

end
