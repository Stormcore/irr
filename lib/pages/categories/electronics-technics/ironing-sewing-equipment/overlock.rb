# encoding: utf-8

class CategoryElectronicsTechnicsIroningOverlockPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/ironing-sewing-equipment/overlock"
  @category = "Электроника и техника -> Гладильное и швейное оборудование -> Оверлоки"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
