# encoding: utf-8

class CategoryCarsPartsAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/accessories"

  def get_parameter (field)
    result = get_generic_parameter(field) 
  end
end
