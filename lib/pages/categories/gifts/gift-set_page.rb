# encoding: utf-8

class CategoryGiftsGiftSetPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/gifts/gift-set"
  @category = "Праздники и подарки -> Подарочные наборы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
