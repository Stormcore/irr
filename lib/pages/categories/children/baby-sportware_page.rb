# encoding: utf-8

class CategoryChildrenBabySportwarePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/baby-sportware"
  @category = "Товары для детей -> Спортивные товары"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип", "type"
end
