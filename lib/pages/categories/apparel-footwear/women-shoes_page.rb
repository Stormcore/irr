# encoding: utf-8

class CategoryApparelFootwearWomenShoesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/women-shoes"
  @category = "Одежда, обувь, аксессуары -> Женская обувь"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид обуви", "shoes_type"
  irr_multi_select "Размеры", "size", "Размер"
  irr_single_select "Материал", "material"
  irr_single_select "Сезонность", "seasonality"
end

