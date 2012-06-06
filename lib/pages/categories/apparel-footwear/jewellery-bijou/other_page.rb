# encoding: utf-8

class CategoryApparelFootwearJewellerybijouOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/jewellery-bijou/other"
  @category = "Одежда, обувь, аксессуары -> Украшения, ювелирные изделия, бижутерия -> Другие украшения"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
