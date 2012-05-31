# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsAcousticsPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/auto-technics/acoustics"
  @category = "Электроника и техника -> Техника для авто -> Автоакустика"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип", "autoacoustic_type"
  irr_single_select "Типоразмер", "tiporazmer"
  irr_range_select "Количество полос", "kolichestvo_polos"
  irr_range_select "Номинальная мощность", "nominalnaya_moshnos"
  irr_range_select "Импеданс, Ом", "impedans", "Импеданс"
end
