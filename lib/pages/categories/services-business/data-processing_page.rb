# encoding: utf-8

class CategoryServicesBusinessDataProcessingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/data-processing"
  @category = "Услуги и деятельность -> Набор и обработка информации"

  irr_multi_select "Тип предложения", "offer"
end

