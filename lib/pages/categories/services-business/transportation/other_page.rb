# encoding: utf-8

class CategoryServicesBusinessTransportationOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/transportation/other"
  @category = "Услуги и деятельность -> Транспортные услуги и аренда -> Другое"

  irr_multi_select "Тип предложения", "offertype"
end

