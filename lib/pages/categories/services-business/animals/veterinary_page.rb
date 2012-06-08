# encoding: utf-8

class CategoryServicesBusinessAnimalsVeterinaryPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/animals/veterinary"
  @category = "Услуги и деятельность -> Услуги для животных -> Ветеринария"

  irr_multi_select "Тип предложения", "offer"
end

