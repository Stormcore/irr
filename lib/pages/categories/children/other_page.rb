# encoding: utf-8

class CategoryChildrenOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/other"
  @category = "Товары для детей -> Другие детские товары"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
