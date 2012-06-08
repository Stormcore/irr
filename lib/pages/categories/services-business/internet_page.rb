# encoding: utf-8

class CategoryServicesBusinessInternetPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/internet"
  @category = "Услуги и деятельность -> Услуги в Интернете"

  irr_multi_select "Тип предложения", "offer"
end

