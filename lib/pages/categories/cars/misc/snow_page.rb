# encoding: utf-8

class CategoryCarsMiscSnowPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/misc/snow"
  @category = "Авто и мото -> Мототехника и Автодома -> Снегоходы и квадроциклы"

  irr_single_select "Тип предложения", "offertype"

end
