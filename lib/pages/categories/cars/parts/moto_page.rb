# encoding: utf-8

class CategoryCarsPartsMotoPage < AdDetailsPage
  include PageObject
  @@getter_functions = Hash.new
  @@setter_functions = Hash.new
  @@url_suffix = "/cars/parts/moto"
  alias get_parameter get_generic_parameter
end
