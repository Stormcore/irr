# encoding: utf-8

class CategoryGardenBanyKupelsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/bany/kupels"
  @category = "Все для дачи -> Для бань и саун -> Купели"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
