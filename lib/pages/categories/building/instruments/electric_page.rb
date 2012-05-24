# encoding: utf-8

class CategoryBuildingInstrumentsElectricPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/instruments/electric"
  @category = "Строительство и ремонт -> Инструменты -> Электроинструменты"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип инструмента", "advert_type_id"
  irr_range_select "Потребляемая мощность, Вт", "potrebljaemaja_moshchnost"
  irr_single_select "Работа от аккумулятора", "battery_work"
  irr_multi_select "Тип аккумулятора", "tip_akkumuljatora"
  irr_range_select "Емкость аккумулятора, А*ч", "emkost_akkumuljatora"
  irr_range_select "Время зарядки аккумулятора, ч", "vremja_zarjadki_akkumuljatora"
  irr_range_select "Вес, кг", "ves"
end
