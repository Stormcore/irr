# encoding: utf-8

class CategoryApparelFootwearJewellerybijouJewelleryPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/jewellery-bijou/jewellery"
  @category = "Одежда, обувь, аксессуары -> Украшения, юверлирные изделия, бижутерия -> Ювелирные изделия"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Изделие", "jewellery_type"
  irr_single_select "Для кого", "jewellery_for"
  irr_single_select "Материал", "jewellery_material"
  irr_multi_select "Вставки", "gem_type"
end
