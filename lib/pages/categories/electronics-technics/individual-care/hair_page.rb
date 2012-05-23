# encoding: utf-8

class CategoryElectronicsTechnicsIndiviualCareHairPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/electronics-technics/individual-care/hair"
  @category = "Электроника и техника -> Индивидуальный уход -> Для укладки волос"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
