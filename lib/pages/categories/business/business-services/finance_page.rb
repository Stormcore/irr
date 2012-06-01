# encoding: utf-8

class CategoryBusinessBusinessServicesFinancePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/business-services/finance"
  @category = "Бизнес и партнерство -> Бизнес услуги -> Финансовая помощь, консультации"

  irr_multi_select "Тип предложения", "offertype"
end
