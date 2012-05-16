# encoding: utf-8

class CategoryCarsMiscWaterPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/misc/water"

  irr_multi_select "Тип предложения", "offertype"

end
