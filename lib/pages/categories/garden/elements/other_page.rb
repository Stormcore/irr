# encoding: utf-8

class CategoryGardenElementsOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/elements/other"
  @category = "Все для дачи -> Садовая мебель, сантехника, декор -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
