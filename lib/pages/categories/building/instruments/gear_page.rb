# encoding: utf-8

class CategoryBuildingInstrumentsGearPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/instruments/gear"
  @category = "Строительство и ремонт -> Инструменты -> Оснастка к инструментам"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип остнастки", "type"
end
