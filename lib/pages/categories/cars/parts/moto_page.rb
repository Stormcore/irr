# encoding: utf-8

class CategoryCarsPartsMotoPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/moto"

  def get_parameter (field)
    get_generic_parameter(field) 
  end
end
