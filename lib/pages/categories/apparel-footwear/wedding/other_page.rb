# encoding: utf-8

class CategoryApparelFootwearWeddingOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/wedding/other"
  @category = "Одежда, обувь, аксессуары -> Всё для свадьбы -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end

