# encoding: utf-8

class CategoryCarsServicesLoansPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/loans"
  @category = "Авто и мото -> Автосервис и услуги -> Кредиты и ссуды"

  irr_single_select "Тип предложения", "offertype"

end
