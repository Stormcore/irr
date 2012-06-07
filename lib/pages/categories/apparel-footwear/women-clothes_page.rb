# encoding: utf-8

class CategoryApparelFootwearWomenClothesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/women-clothes"
  @category = "Одежда, обувь, аксессуары -> Женская одежда"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид одежды", "clothes_type"
  irr_multi_select "Размеры", "size", "Размер"
end

