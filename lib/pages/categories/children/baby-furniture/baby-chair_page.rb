# encoding: utf-8

class CategoryChildrenBabyFurnitureBabyChairPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/baby-furniture/baby-chair/"
  @category = "Товары для детей -> Детская мебель -> Стульчики для кормления, столы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
