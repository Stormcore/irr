# encoding: utf-8

class CategoryRealEstateOutoftownCottagePage < AdDetailsPage
  include PageObject
  include CityWithMetro
  
  @@url_suffix = "/real-estate/out-of-town/cottage"
  @category = "Недвижимость -> Дома, дачи, участки. Продажа -> Коттеджные поселки"

  irr_range_select  "Площадь строения", "meters-total", "Площадь дома"
  irr_range_select  "Площадь участка", "land"
end
