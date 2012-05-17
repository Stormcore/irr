# encoding: utf-8

class CategoryRealEstateOutoftownCottagePage < AdDetailsPage
  include PageObject
  include CityWithMetro
  
  @@url_suffix = "/real-estate/out-of-town/cottage"

  irr_range_select  "Общая площадь", "meters-total"
  irr_range_select  "Площадь участка", "land"
end
