# encoding: utf-8

class CategoryChildrenBabyShoesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/children/baby-shoes"
  @category = "Товары для детей -> Детская обувь"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип", "type"
end
