# encoding: utf-8

class CategoryGiftsGiftCertificatePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/gifts/gift-certificate"
  @category = "Праздники и подарки -> Подарочные сертификаты"

  irr_multi_select "Тип предложения", "offertype"
end
