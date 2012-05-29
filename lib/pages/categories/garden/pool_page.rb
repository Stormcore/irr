# encoding: utf-8

class CategoryGardenPoolPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/pool"
  @category = "Все для дачи -> Бассейны и принадлежности"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
