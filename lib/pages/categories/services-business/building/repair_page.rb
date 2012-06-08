# encoding: utf-8

class CategoryServicesBusinessBuildingRepairPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/building/repair"
  @category = "Услуги и деятельность -> Строительные и ремонтные услуги -> Отделочные и ремонтные работы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Вид услуги", "operations_multi"
end

