# encoding: utf-8

class CategoryGiftsDecorationPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/gifts/decoration"
  @category = "Праздники и подарки -> Подарки для декора и интерьера"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Тип", "cfd_souvenir_type"
end
