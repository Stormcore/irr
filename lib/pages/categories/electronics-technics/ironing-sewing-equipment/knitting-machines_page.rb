# encoding: utf-8

class CategoryElectronicsTechnicsIroningKnittingMachinesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/ironing-sewing-equipment/knitting-machine"
  @category = "Электроника и техника -> Гладильное и швейное оборудование -> Вязальные машины"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
