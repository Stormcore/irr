# encoding: utf-8

class CategoryCarsServicesAssistancePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/assistance"

  irr_single_select "Тип предложения", "offertype"

end
