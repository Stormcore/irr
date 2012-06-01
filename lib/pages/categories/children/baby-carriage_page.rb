# encoding: utf-8

class CategoryChildrenBabyCarriagePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/baby-carriage"
  @category = "Товары для детей -> Детские коляски"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Тип", "type"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_single_select "Механизм складывания", "folding_mechanism"
  irr_single_select "Количество детей", "baby_number"
end
