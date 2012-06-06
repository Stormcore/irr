# encoding: utf-8

class CategoryApparelFootwearWeddingAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/wedding/wedding_accessories"
  @category = "Одежда, обувь, аксессуары -> Всё для свадьбы -> Аксессуары для невесты"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид аксессуара", "accessories_type"
end

