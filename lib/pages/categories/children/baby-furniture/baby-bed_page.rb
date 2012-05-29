# encoding: utf-8

class CategoryChildrenBabyFurnitureBabyBedPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/baby-furniture/baby-bed/"
  @category = "Товары для детей -> Детская мебель -> Кроватки"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Производитель", "make"
end
