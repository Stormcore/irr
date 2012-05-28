# encoding: utf-8

class CategoryGardenBanyOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/bany/other"
  @category = "Все для дачи -> Для бань и саун -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
