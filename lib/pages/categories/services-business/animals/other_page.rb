# encoding: utf-8

class CategoryServicesBusinessAnimalsOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/animals/other"
  @category = "Услуги и деятельность -> Услуги для животных -> Другие"

  irr_multi_select "Тип предложения", "offer"
end

