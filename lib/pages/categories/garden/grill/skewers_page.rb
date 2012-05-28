# encoding: utf-8

class CategoryGardenGrillSkewersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/grill/skewers"
  @category = "Все для дачи -> Грили, мангалы -> Решетки, шампуры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
