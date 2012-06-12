# encoding: utf-8

class CategoryGiftsHandmadePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/gifts/handmade"
  @category = "Праздники и подарки -> Подарки ручной работы"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Тип", "cfd_card_type"
end
