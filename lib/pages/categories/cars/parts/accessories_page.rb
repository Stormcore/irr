# encoding: utf-8

class CategoryCarsPartsAccessoriesPage < AdDetailsPage
  include PageObject

  def get_parameter (field)
    result = get_generic_parameter(field) 
  end
end