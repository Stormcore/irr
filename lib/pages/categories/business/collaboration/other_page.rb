# encoding: utf-8

class CategoryBusinessCollaborationOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/collaboration/sales"
  @category = "Бизнес и партнерство -> Партнерство и сотрудничество -> Другое"

  irr_multi_select "Тип предложения", "offertype"
end
