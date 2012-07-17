# encoding: utf-8

class CategoryRealEstateServicesPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/services"
  @category = "Недвижимость -> Услуги"
end
