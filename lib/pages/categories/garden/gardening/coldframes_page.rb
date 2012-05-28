# encoding: utf-8

class CategoryGardenGardeningColdframesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/gardening/coldframes"
  @category = "Все для дачи -> Товары для садоводства -> Теплицы, парники"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Вид", "type"
end
