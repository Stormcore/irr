# encoding: utf-8

class CategoryCarsPartsCareProductsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/care-products"

  def get_parameter (field)
    get_generic_parameter(field) 
  end
end
