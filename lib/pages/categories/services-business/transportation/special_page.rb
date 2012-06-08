# encoding: utf-8

class CategoryServicesBusinessTransportationSpecialPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/transportation/special"
  @category = "Услуги и деятельность -> Транспортные услуги и аренда -> Аренда спецтехники и вывоз отходов"

  irr_multi_select "Тип предложения", "offer"
end

