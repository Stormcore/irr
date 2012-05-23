# encoding: utf-8

class CategoryElectronicsTechnicsIndiviualCareHairStylePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/electronics-technics/individual-care/hairstyle"
  @category = "Электроника и техника -> Индивидуальный уход -> Для стрижки волос"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
