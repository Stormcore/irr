# encoding: utf-8

class CategoryServicesBusinessRealEstatePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/real-estate"
  @category = "Услуги и деятельность -> Агентства недвижимости"

  irr_multi_select "Тип предложения", "offer"
end

