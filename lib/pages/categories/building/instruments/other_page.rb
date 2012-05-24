# encoding: utf-8

class CategoryBuildingInstrumentsOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/instruments/other"
  @category = "Строительство и ремонт -> Инструменты -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
