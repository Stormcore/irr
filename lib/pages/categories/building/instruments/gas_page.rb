# encoding: utf-8

class CategoryBuildingInstrumentsGasPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/instruments/gas"
  @category = "Строительство и ремонт -> Инструменты -> Бензоинструмент"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип инструмента", "advert_type_id"
  irr_range_select "Мощность, Вт", "potrebljaemaja_moshchnost"
  irr_range_select "Объем двигателя, куб. см.", "volume"
  irr_range_select "Вес, кг", "ves"
end
