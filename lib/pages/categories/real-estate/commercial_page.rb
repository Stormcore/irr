# encoding: utf-8

class CategoryRealEstateCommercialPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/commercial"
  @category = "Недвижимость -> Коммерческая недвижимость"

end
