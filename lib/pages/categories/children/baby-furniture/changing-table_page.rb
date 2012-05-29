# encoding: utf-8

class CategoryChildrenBabyFurnitureChangingTablePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/baby-furniture/changing-table/"
  @category = "Товары для детей -> Детская мебель -> Пеленальные столики, комоды"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
