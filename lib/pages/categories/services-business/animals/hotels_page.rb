# encoding: utf-8

class CategoryServicesBusinessAnimalsHotelsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/animals/hotels"
  @category = "Услуги и деятельность -> Услуги для животных -> Питомники, зоогостиницы, няни, содержание"

  irr_multi_select "Тип предложения", "offertype"
end

