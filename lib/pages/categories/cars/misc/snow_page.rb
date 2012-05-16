# encoding: utf-8

class CategoryCarsMiscSnowPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/misc/snow"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Источник", "sourcefrom"

end
