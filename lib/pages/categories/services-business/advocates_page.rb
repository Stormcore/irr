# encoding: utf-8

class CategoryServicesBusinessAdvocatesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/advocates"
  @category = "Услуги и деятельность -> Адвокаты, нотариусы, специалисты"

  irr_multi_select "Тип предложения", "offertype"
end

