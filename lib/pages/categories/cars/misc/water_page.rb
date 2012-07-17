# encoding: utf-8

class CategoryCarsMiscWaterPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/misc/water"
  @category = "Авто и мото -> Мототехника и Автодома -> Водный транспорт"

  irr_single_select "Тип предложения", "offertype"

end
