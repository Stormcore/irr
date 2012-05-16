# encoding: utf-8

class CategoryCarsServicesLoansPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/loans"

  irr_single_select "Тип предложения", "offertype"

end
