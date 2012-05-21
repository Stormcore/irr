# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsCarWashesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/auto-technics/car-washes"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Класс", "klass"
  irr_range_select "Производительность", "proizvoditelnost"
  irr_range_select "Давление", "davlenie"
  irr_single_select "Материал корпуса насоса", "material_korpusa_nasosa"
  irr_single_select "Насадки", "nasadki"
  irr_checkbox     "Использование моющего средства", "ispolzovanie_mojushchego_sredstva"
end
