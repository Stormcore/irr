# encoding: utf-8

class CategoryBusinessCollaborationSalesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/collaboration/sales"
  @category = "Бизнес и партнерство -> Партнерство и сотрудничество -> Представительство, реализация"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Сфера деятельности", "area_type"
end
