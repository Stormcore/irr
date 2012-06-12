# encoding: utf-8

class CategoryGiftsHobbyPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/gifts/hobby"
  @category = "Праздники и подарки -> Хобби и развлечения"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Тип", "cfd_hobby_type"
end
