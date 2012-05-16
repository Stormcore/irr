# encoding: utf-8

class CategoryCarsPartsCommercialPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/commercial"
  alias get_parameter get_generic_parameter
end
