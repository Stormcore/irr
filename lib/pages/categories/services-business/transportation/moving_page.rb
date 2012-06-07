# encoding: utf-8

class CategoryServicesBusinessTransportationMovingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/transportation/moving"
  @category = "Услуги и деятельность -> Транспортные услуги и аренда -> Грузоперевозки, перевозки, грузчики"

  irr_multi_select "Тип предложения", "offertype"
end

