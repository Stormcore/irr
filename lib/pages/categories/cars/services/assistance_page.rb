# encoding: utf-8

class CategoryCarsServicesAssistancePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/assistance"
  @category = "Авто и мото -> Автосервис и услуги -> Эвакуация и тех. помощь"

  irr_single_select "Тип предложения", "offertype"

end
