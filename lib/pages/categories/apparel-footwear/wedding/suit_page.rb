# encoding: utf-8

class CategoryApparelFootwearWeddingSuitPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/wedding/suit"
  @category = "Одежда, обувь, аксессуары -> Всё для свадьбы -> Костюмы, смокинги"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end

