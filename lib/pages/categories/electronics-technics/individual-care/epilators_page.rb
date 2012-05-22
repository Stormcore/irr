# encoding: utf-8

class CategoryElectronicsTechnicsIndiviualCareEpilatorsPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/individual-car/epilators"
  @category = "Электроника и техника -> Индивидуальный уход -> Эпиляторы"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
