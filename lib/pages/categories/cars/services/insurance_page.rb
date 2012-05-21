# encoding: utf-8

class CategoryCarsServicesInsurancePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/insurance"
  @category = "Авто и мото -> Автосервис и услуги -> Комиссионное оформление и страхование"

  irr_single_select "Тип предложения", "offertype"

end
