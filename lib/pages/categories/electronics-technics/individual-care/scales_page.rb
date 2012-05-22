# encoding: utf-8

class CategoryElectronicsTechnicsIndiviualCareScalesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/individual-car/scales"
  @category = "Электроника и техника -> Индивидуальный уход -> Весы напольные"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
