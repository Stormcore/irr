# encoding: utf-8

class CategoryCarsPartsCommercialPage < AdDetailsPage
  include PageObject

  def get_parameter (field)
    get_generic_parameter(field) 
  end
end