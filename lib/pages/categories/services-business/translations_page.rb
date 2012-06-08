# encoding: utf-8

class CategoryServicesBusinessTranslationsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/translations"
  @category = "Услуги и деятельность -> Услуги переводчиков"

  irr_multi_select "Тип предложения", "offer"
end

