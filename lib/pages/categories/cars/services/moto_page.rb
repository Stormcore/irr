# encoding: utf-8

class CategoryCarsServicesMotoPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/moto"
  @category = "Авто и мото -> Автосервис и услуги -> Ремонт и сервис мототехники и других видов транспорта"

  irr_single_select "Тип предложения", "offertype"

end
