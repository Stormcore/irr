# encoding: utf-8

class CategoryBusinessBusinessServicesCreditPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/business-services/credit"
  @category = "Бизнес и партнерство -> Бизнес услуги -> Помощь в получении кредита"

  irr_multi_select "Тип предложения", "offertype"
end
