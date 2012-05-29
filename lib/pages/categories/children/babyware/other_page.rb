# encoding: utf-8

class CategoryChildrenBabywareOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/babyware/other/"
  @category = "Товары для детей -> Товары для малышей -> Прочее"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
