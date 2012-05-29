# encoding: utf-8

class CategoryChildrenSchoolwarePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/schoolware"
  @category = "Товары для детей -> Товары для школы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип", "type"
end
