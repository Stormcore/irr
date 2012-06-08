# encoding: utf-8

class CategoryServicesBusinessBuildingDesignPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/building/design"
  @category = "Услуги и деятельность -> Строительные и ремонтные услуги -> Проектирование и дизайн"

  irr_multi_select "Тип предложения", "offer"
  irr_multi_select "Вид услуг", "operations_multi"
end

