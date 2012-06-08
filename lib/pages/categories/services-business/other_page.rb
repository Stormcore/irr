# encoding: utf-8

class CategoryServicesBusinessOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/other"
  @category = "Услуги и деятельность -> Другое"

  irr_multi_select "Тип предложения", "offer"
end

