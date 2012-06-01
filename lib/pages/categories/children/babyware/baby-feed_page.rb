# encoding: utf-8

class CategoryChildrenBabywareBabyFeedPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/babyware/baby-feed/"
  @category = "Товары для детей -> Товары для малышей -> Кормление"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип", "type"
end
