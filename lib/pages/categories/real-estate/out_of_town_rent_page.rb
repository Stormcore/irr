# encoding: utf-8

class CategoryRealEstateOutoftownRentPage < AdDetailsPage
  include PageObject
  include Regions
  include Rent

  @@url_suffix = "/real-estate/out-of-town-rent"

  irr_range_select "Год постройки/сдачи", "house-year"
  irr_range_select "Площадь участка", "land"
  irr_range_select "Площадь строения", "meters-total"
  irr_range_select "Количество комнат", "rooms"
  irr_range_select "Количество спален", "rooms_sleep"
  
  irr_single_select "Материал стен", "walltype"
  irr_multi_select "Строение", "object"
  irr_checkbox     "Отапливаемый", "heating1"
  irr_checkbox     "Гараж", "garage"
  irr_checkbox     "Телефон", "telephone"
  irr_checkbox     "Интернет", "internet"
  irr_checkbox     "Мебель", "furniture"
  irr_checkbox     "Бытовая техника", "household"
end
