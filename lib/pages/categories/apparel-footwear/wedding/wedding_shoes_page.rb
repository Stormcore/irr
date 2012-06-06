# encoding: utf-8

class CategoryApparelFootwearWeddingShoesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/wedding/wedding_shoes"
  @category = "Одежда, обувь, аксессуары -> Всё для свадьбы -> Свадебная обувь"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид обуви", "cfd_wedding_shoes"
end
