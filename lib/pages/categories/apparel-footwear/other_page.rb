# encoding: utf-8

class CategoryApparelFootwearOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/other"
  @category = "Одежда, обувь, аксессуары -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end

class CategoryApparelFootwearAccessoriesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/accessories"
  @category = "Одежда, обувь, аксессуары -> Аксессуары"

end

class CategoryApparelFootwearJewelleryBijouPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/jewellery-bijou"
  @category = "Одежда, обувь, аксессуары -> Украшения, ювелирные изделия, бижутерия"

end

class CategoryApparelFootwearWeddingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/apparel-footwear/wedding"
  @category = "Одежда, обувь, аксессуары -> Всё для свадьбы"

end
