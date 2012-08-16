# encoding: utf-8

class CategoryServicesBusinessActionsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/services-business/actions"
  @category = "Услуги и деятельность -> Организация праздников, фото-, видеосъёмка"

  irr_multi_select "Тип предложения", "offer"
  irr_multi_select "Вид услуги", "service_type"
end

