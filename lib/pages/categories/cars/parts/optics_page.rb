# encoding: utf-8

class CategoryCarsPartsOpticsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/optics"

  def get_parameter (field)
    get_generic_parameter(field) 
  end
end
