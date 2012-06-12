# encoding: utf-8

class CategoryGiftsFlowerPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/gifts/flower"
  @category = "Праздники и подарки -> Букеты, декоративные цветы и вкусные подарки"

  irr_multi_select "Тип предложения", "offertype"
end
