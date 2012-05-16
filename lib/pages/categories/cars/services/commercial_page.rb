# encoding: utf-8

class CategoryCarsServicesCommercialPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/commercial"

  irr_single_select "Тип предложения", "offertype"

end
