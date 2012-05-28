# encoding: utf-8

class CategoryGardenEquipmentPressureWashersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/equipment/pressure_washers"
  @category = "Все для дачи -> Садовая техника -> Мойки высокого давления"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_single_select "Класс", "klass"
  irr_range_select "Производительность, л/час", "proizvoditelnost"
  irr_range_select "Максимальное давление, бар", "davlenie", "Давление, бар"
  irr_single_select "Материал корпуса насоса", "material_korpusa_nasosa"
  irr_single_select "Насадки", "nasadki" 
  irr_checkbox     "Использование моющего средства", "ispolzovanie_mojushchego_sredstva"

end
