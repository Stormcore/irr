# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsOtherPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/auto-technics/other"
  @category = "Электроника и техника -> Техника для авто -> Другое"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
