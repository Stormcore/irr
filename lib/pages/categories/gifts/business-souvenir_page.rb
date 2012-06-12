# encoding: utf-8

class CategoryGiftsBusinessSouvenirPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/gifts/business-souvenir"
  @category = "Праздники и подарки -> Бизнес сувениры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Тип", "cfd_business_souvenir"
end
