# encoding: utf-8

class CategoryBuildingInstrumentsPneumaticPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/instruments/pneumatic"
  @category = "Строительство и ремонт -> Инструменты -> Пневмоинструмент"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип инструмента", "advert_type_id"
  irr_range_select "Расход воздуха, л/мин", "rashod_vozduha"
  irr_range_select "Давление, бар", "davlenije"
  irr_range_select "Вес, кг", "ves"
end
