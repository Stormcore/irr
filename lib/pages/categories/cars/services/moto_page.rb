# encoding: utf-8

class CategoryCarsServicesMotoPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/moto"

  irr_single_select "Тип предложения", "offertype"

end
