# encoding: utf-8

class CategoryElectronicsTechnicsWashingMachinesDryingPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/washing-machines/drying"
  @category = "Электроника и техника -> Стиральные машины -> Сушильные машины"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Объем загрузки", "drying_vol"
end
