# encoding: utf-8

class CategoryRealEstateGarageStallPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  
  @@url_suffix = "/real-estate/garage/stall"
  @category = "Недвижимость -> Гаражи и стоянки. Продажа -> Гаражи и боксы"

  irr_multi_select  "Тип гаража", "garage_type"
  irr_multi_select  "Машиномест", "numberofcars"
  irr_checkbox      "Отапливаемый", "heating1"
end
