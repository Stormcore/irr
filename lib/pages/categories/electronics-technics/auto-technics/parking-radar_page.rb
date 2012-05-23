# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsParkingRadarPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/electronics-technics/auto-technics/parking-radars"
  @category = "Электроника и техника -> Техника для авто -> Парковочные радары"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип отображения", "tip"
  irr_range_select  "Количество датчиков, шт", "kolichestvo_datchikov"
  irr_range_select  "Расстояние до препятствия, м", "rasstoyanie_do_prepyatstvija"
end
