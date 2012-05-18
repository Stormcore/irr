# encoding: utf-8

class CategoryElectronicsTechnicsWashingMachinesWashingPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/washing-machines/washing"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип загрузки", "washmach_load"
  irr_single_select "Объем загрузки", "washmach_vol"
  irr_checkbox      "Сушка", "washmach_dry"
  irr_checkbox      "Встраиваемая техника", "fridge_builtin"
end
