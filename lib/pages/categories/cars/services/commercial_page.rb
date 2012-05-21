# encoding: utf-8

class CategoryCarsServicesCommercialPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/commercial"
  @category = "Авто и мото -> Автосервис и услуги -> Ремонт и сервис коммерческого транспорта"

  irr_single_select "Тип предложения", "offertype"

end
