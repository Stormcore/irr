# encoding: utf-8

class CategoryBusinessBusinessServicesOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/business-services/other"
  @category = "Бизнес и партнерство -> Бизнес услуги -> Другие услуги"

  irr_multi_select "Тип предложения", "offertype"
end
