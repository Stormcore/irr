# encoding: utf-8

class CategoryElectronicsTechnicsIroningIronsPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/ironing-sewing-equipment/irons"
  @category = "Электроника и техника -> Гладильное и швейное оборудование -> Утюги"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
