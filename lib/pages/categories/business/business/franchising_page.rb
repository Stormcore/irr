# encoding: utf-8

class CategoryBusinessBusinessFranchisingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/business/franchising"
  @category = "Бизнес и партнерство -> Готовый бизнес -> Франшизы"

  irr_multi_select "Тип предложения", "offertype"
end
