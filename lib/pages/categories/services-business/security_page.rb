# encoding: utf-8

class CategoryServicesBusinessSecurityPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/security"
  @category = "Услуги и деятельность -> Безопасность, детективы"

  irr_multi_select "Тип предложения", "offertype"
end

