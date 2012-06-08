# encoding: utf-8

class CategoryServicesBusinessAnimalsGroomingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/animals/grooming"
  @category = "Услуги и деятельность -> Услуги для животных -> Стрижка"

  irr_multi_select "Тип предложения", "offertype"
end

