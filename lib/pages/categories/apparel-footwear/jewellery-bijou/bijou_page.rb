# encoding: utf-8

class CategoryApparelFootwearJewellerybijouBijouPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/jewellery-bijou/bijou"
  @category = "Одежда, обувь, аксессуары -> Украшения, юверлирные изделия, бижутерия -> Бижутерия"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Изделие", "bijou_type"
end
