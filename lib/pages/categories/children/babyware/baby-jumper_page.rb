# encoding: utf-8

class CategoryChildrenBabywarebabyJumperPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/babyware/baby-jumper/"
  @category = "Товары для детей -> Товары для малышей -> Ходунки, прыгунки, шезлонги"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип", "type"
end
