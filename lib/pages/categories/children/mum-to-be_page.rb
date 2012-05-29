# encoding: utf-8

class CategoryChildrenMumToBePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/mum-to-be"
  @category = "Товары для детей -> Для будущих мам"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
