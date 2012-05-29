# encoding: utf-8

class CategoryChildrenBabyCarseatPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/toys"
  @category = "Товары для детей -> Игрушки"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_checkbox     "Для мальчиков", "for_boys"
  irr_checkbox     "Для девочек", "for_girls"
  irr_checkbox     "Для новорожденных", "for_baby"
  irr_single_select "Тип", "type"
  irr_single_select "Материал", "toy_material"
  irr_single_select "Возраст", "baby_age"
end
