# encoding: utf-8

class CategoryGiftsOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/gifts/other"
  @category = "Праздники и подарки -> Другое"

  irr_multi_select "Тип предложения", "offertype"
end
