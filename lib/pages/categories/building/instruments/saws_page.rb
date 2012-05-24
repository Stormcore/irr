# encoding: utf-8

class CategoryBuildingInstrumentsSawsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/instruments/saws"
  @category = "Строительство и ремонт -> Инструменты -> Пилы, электро, бензопилы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип", "type"
  irr_multi_select "Конструкция", "construction"
  irr_multi_select "Тип двигателя", "engine"
end
