# encoding: utf-8

class CategoryCarsMiscWaterPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/misc/water"

  irr_single_select "Тип предложения", "offertype"

end
