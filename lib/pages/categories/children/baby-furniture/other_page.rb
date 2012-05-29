# encoding: utf-8

class CategoryChildrenBabyFurnitureOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/baby-furniture/other/"
  @category = "Товары для детей -> Детская мебель -> Прочее"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
