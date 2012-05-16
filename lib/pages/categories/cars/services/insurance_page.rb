# encoding: utf-8

class CategoryCarsServicesInsurancePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/insurance"

  irr_single_select "Тип предложения", "offertype"

end
