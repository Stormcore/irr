# encoding: utf-8

class CategoryCarsMiscMotoPage < AdDetailsPage
  include PageObject
  
  @@getter_functions = Hash.new
  @@setter_functions = Hash.new
  @@url_suffix = "/cars/misc/moto"

  irr_multi_select "Новый или подержанный", "used-or-new"
  irr_range_select "Год выпуска", "car-year"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
end
