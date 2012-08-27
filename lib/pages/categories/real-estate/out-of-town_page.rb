# encoding: utf-8

class CategoryRealEstateOutoftownPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/out-of-town"
  @category = "Недвижимость -> Дома, дачи, участки. Продажа"

  irr_multi_select  "Строение", "object"

end
