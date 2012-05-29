# encoding: utf-8

class CategoryChildrenBabyClothesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/baby-clothes"
  @category = "Товары для детей -> Детская одежда"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Пол", "sex"
  irr_multi_select "Тип", "type"
  irr_multi_select "Размер", "size_baby"
  irr_multi_select "Сезонность", "seasonality_baby"
end
