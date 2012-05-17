# encoding: utf-8

class CategoryRealEstateOtherPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/other"
end
