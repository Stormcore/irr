# encoding: utf-8

class CategoryRealEstateExchangePage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/exchange"
end
