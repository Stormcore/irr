# encoding: utf-8

class CategoryElectronicsTechnicsIndiviualCareToothbrushesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/electronics-technics/individual-care/toothbrushes"
  @category = "Электроника и техника -> Индивидуальный уход -> Зубные щетки"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
