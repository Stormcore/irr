# encoding: utf-8

class CategoryCarsMiscMotoPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/misc/moto"
  @category = "Авто и мото -> Мототехника и Автодома -> Мотоциклы и мопеды"

  irr_multi_select "Новый или подержанный", "used-or-new"
  irr_range_select "Год выпуска", "car-year"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_multi_select "Источник", "sourcefrom"
end
