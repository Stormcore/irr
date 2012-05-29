# encoding: utf-8

class CategoryChildrenBabyFurniturePlaypenPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/baby-furniture/playpen/"
  @category = "Товары для детей -> Детская мебель -> Манежи"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
