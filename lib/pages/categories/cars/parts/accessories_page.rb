# encoding: utf-8

class CategoryCarsPartsAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/accessories"
  alias get_parameter get_generic_parameter
end
