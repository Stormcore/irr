# encoding: utf-8

class CategoryBuildingInstrumentsMeasuringPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/instruments/measuring"
  @category = "Строительство и ремонт -> Инструменты -> Измерительный инструмент"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип инструмента", "type"
end
