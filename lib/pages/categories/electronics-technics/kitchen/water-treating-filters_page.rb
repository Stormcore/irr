# encoding: utf-8

class CategoryElectronicsTechnicsKitchenWaterPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/water-treating-filters"
  @category = "Электроника и техника -> Кухонная техника -> Фильтры для очистки воды и картриджи"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_radio_select "Вид", "filter_kartr_select"
end
