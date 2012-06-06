# encoding: utf-8

class CategoryApparelFootwearOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/other"
  @category = "Одежда, обувь, аксессуары -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end

