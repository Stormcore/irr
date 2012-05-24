# encoding: utf-8

class CategoryBuildingInstrumentsStepladdersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/instruments/stepladders"
  @category = "Строительство и ремонт -> Инструменты -> Стремянки, приставные лестницы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип остнастки", "type"
end
