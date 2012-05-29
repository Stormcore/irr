# encoding: utf-8

class CategoryGardenOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/other"
  @category = "Все для дачи -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
