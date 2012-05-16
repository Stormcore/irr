# encoding: utf-8

class CategoryCarsPartsCommercialPage < AdDetailsPage
  include PageObject
  @@getter_functions = Hash.new
  @@setter_functions = Hash.new
  @@url_suffix = "/cars/parts/commercial"
  alias get_parameter get_generic_parameter
end
