# encoding: utf-8

class CategoryRealEstateGarageRentStallPage < AdDetailsPage
  include PageObject
  include CityWithMetro
  include Rent
  
  @@url_suffix = "/real-estate/garage-rent/stall"
  @category = "Недвижимость -> Гаражи и стоянки. Аренда -> Гаражи и боксы"

  irr_multi_select  "Тип гаража", "garage_type"
  irr_multi_select  "Машиномест", "numberofcars"
  irr_checkbox      "Отапливаемый", "heating1"
end
