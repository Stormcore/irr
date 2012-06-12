# encoding: utf-8

class CategoryGiftsHobbyPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/gifts/hobby"
  @category = "Праздники и подарки -> Хобби и развлечения"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Тип", "cfd_souvenir_type"
end
