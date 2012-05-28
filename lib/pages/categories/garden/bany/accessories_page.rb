# encoding: utf-8

class CategoryGardenBanyAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/bany/accessories"
  @category = "Все для дачи -> Для бань и саун -> Аксессуары и принадлежности"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
