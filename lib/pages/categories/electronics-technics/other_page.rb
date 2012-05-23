# encoding: utf-8

class CategoryElectronicsTechnicsOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/electronics-technics/other"
  @category = "Электроника и техника -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
