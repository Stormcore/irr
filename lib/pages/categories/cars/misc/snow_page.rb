# encoding: utf-8

class CategoryCarsMiscSnowPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/misc/snow"

  irr_single_select "Тип предложения", "offertype"

end
