# encoding: utf-8

class CategoryApparelFootwearAccessoriesOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/accessories-men-women/other"
  @category = "Одежда, обувь, аксессуары -> Аксессуары -> Другие аксессуары"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
