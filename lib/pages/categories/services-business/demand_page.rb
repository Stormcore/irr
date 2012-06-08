# encoding: utf-8

class CategoryServicesBusinessDemandPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/demand"
  @category = "Услуги и деятельность -> Спрос"

  irr_multi_select "Тип предложения", "offer"
end

