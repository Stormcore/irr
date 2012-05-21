# encoding: utf-8

class CategoryElectronicsTechnicsKitchenMixersPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/kitchen/mixers"
  @category = "Электроника и техника -> Кухонная техника -> Миксеры, блендеры"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_radio_select "Вид", "blendmix_select"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
end
