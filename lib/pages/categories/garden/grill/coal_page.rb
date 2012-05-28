# encoding: utf-8

class CategoryGardenGrillCoalPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/grill/coal"
  @category = "Все для дачи -> Грили, мангалы -> Уголь, средства розжига"

  irr_multi_select "Тип предложения", "offertype"
end
