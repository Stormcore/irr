# encoding: utf-8

class CategoryChildrenBabyTextilePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/baby-textile"
  @category = "Товары для детей -> Постельные принадлежности"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип", "type"
end
