# encoding: utf-8

class CategoryCarsPartsAccessoriesPage < AdDetailsPage
  include PageObject
  @@getter_functions = Hash.new
  @@setter_functions = Hash.new
  @@url_suffix = "/cars/parts/accessories"
  alias get_parameter get_generic_parameter
end
