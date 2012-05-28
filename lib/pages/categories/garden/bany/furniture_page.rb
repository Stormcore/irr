# encoding: utf-8

class CategoryGardenBanyFurniturePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/bany/furniture"
  @category = "Все для дачи -> Для бань и саун -> Мебель для бани, сауны"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
