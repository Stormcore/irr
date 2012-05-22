# encoding: utf-8

class CategoryElectronicsTechnicsIndiviualCareRazorsPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/individual-car/razors-trimmers"
  @category = "Электроника и техника -> Индивидуальный уход -> Бритвы, триммеры"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
