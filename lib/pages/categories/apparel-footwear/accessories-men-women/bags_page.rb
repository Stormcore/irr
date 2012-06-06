# encoding: utf-8

class CategoryApparelFootwearAccessoriesBagsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/accessories-men-women/bags"
  @category = "Одежда, обувь, аксессуары -> Аксессуары -> Сумки, чемоданы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "bags_type"
  irr_single_select "Для кого", "bags_for"
  irr_single_select "Материал", "bags_material"
end
