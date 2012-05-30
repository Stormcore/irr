# encoding: utf-8

class CategoryBusinessBusinessServicesBookKeepingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/business-services/legal"
  @category = "Бизнес и партнерство -> Бизнес услуги -> Бухгалтерское, аудиторское сопровождение"

  irr_multi_select "Тип предложения", "offertype"
end
