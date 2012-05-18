# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsTVPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/auto-technics/antennas"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип", "tip"
  irr_single_select "Тип размещения", "tip_razmeshenija"
  irr_single_select  "Диапазон принимаемых частот", "diapazon_prinimaemiyh_chastot"
  irr_range_select  "Длина кабеля", "dlina_kabelya"
  irr_range_select  "Дальность приема", "dalnost_priema"
end
