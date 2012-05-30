# encoding: utf-8

class CategoryBusinessBusinessServicesLegalPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/business-services/legal"
  @category = "Бизнес и партнерство -> Бизнес услуги -> Юридическое сопровождение"

  irr_multi_select "Тип предложения", "offertype"
end
