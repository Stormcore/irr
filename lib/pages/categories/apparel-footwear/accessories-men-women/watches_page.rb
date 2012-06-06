# encoding: utf-8

class CategoryApparelFootwearAccessoriesWatchesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/accessories-men-women/watches"
  @category = "Одежда, обувь, аксессуары -> Аксессуары -> Наручные часы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Изделие", "mechanism"
  irr_single_select "Для кого", "whatch_for"
  irr_single_select "Материал", "watches_material"
end
