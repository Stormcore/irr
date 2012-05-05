# encoding: utf-8

class CategoryCarsPartsCommercialPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/commercial"

  def get_parameter (field)
    get_generic_parameter(field) 
  end
end
