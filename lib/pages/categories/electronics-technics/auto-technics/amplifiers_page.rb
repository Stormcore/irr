# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsAmplifiersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/auto-technics/amplifiers"
  @category = "Электроника и техника -> Техника для авто -> Усилители"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_single_select "Количество каналов", "kolichestvo_canalov"
  irr_single_select "Класс усиления", "klass"
end
