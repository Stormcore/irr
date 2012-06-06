# encoding: utf-8

class CategoryChildrenBabyCarseatPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/baby-carseat"
  @category = "Товары для детей -> Автокресла"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Группа", "group"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
end
