# encoding: utf-8

class CategoryCarsPartsMotoPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/moto"
  alias get_parameter get_generic_parameter
end
