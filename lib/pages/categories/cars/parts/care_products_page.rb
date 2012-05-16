# encoding: utf-8

class CategoryCarsPartsCareProductsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/parts/care-products"
  alias get_parameter get_generic_parameter
end
