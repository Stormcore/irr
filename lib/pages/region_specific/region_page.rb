# encoding: utf-8

module Regions
  include PageObject

  irr_multi_select "Регион",        "ab_area", "Расположение"
  irr_multi_select "Направление",   "direction"
  irr_multi_select "Шоссе",         "shosse"
  irr_range_select "Удаленность",   "distance_mkad"
end
