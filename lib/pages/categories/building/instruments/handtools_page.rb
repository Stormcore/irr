# encoding: utf-8

class CategoryBuildingInstrumentsHandtoolsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/instruments/handtools"
  @category = "Строительство и ремонт -> Инструменты -> Ручной инструмент"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип инструмента", "advert_type_id"
end
