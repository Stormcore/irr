# encoding: utf-8

class CategoryBusinessCollaborationPartnershipPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/collaboration/partnership"
  @category = "Бизнес и партнерство -> Партнерство и сотрудничество -> Партнерство"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Сфера деятельности", "area_type"
  irr_range_select "Доход, руб", "income"
  irr_range_select "Срок окупаемости, лет", "payback_period"
end
