# encoding: utf-8

class CategoryGardenGrillOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/grill/other"
  @category = "Все для дачи -> Грили, мангалы -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
