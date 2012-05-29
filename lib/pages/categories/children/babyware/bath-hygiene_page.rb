# encoding: utf-8

class CategoryChildrenBabywareBathHygienePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/babyware/baby-hygiene/"
  @category = "Товары для детей -> Товары для малышей -> Купание, гигиена"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип", "type"
end
