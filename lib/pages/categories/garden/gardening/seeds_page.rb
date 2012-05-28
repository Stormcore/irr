# encoding: utf-8

class CategoryGardenGardeningSeedsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/gardening/seeds"
  @category = "Все для дачи -> Товары для садоводства -> Посадочный материал"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Вид", "type"
end
