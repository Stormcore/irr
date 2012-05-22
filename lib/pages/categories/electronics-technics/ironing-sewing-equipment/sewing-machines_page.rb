# encoding: utf-8

class CategoryElectronicsTechnicsIroningSewingMachinesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/ironing-sewing-equipment/sewing-machines"
  @category = "Электроника и техника -> Гладильное и швейное оборудование -> Швейные машины"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
