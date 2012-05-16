# encoding: utf-8

class CategoryCarsPartsOpticsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/optics"
  alias get_parameter get_generic_parameter
end
