# encoding: utf-8

class CategoryApparelFootwearWeddingDressPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/wedding/wedding-dress"
  @category = "Одежда, обувь, аксессуары -> Всё для свадьбы -> Свадебные платья"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Стиль", "dress_style"
end
