# encoding: utf-8

class CategoryServicesBusinessBuildingOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/building/other"
  @category = "Услуги и деятельность -> Строительные и ремонтные услуги -> Другое"

  irr_multi_select "Тип предложения", "offertype"
end

