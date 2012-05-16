# encoding: utf-8

class CategoryCarsPartsOpticsPage < AdDetailsPage
  include PageObject
  @@getter_functions = Hash.new
  @@setter_functions = Hash.new
  @@url_suffix = "/cars/parts/optics"
  alias get_parameter get_generic_parameter
end
