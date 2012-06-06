# encoding: utf-8

class CategoryArtsMusicOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/arts-music/other/"
  @category = "Музыка, искусство -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end

