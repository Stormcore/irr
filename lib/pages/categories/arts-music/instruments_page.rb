# encoding: utf-8

class CategoryArtsMusicInstrumentsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/arts-music/instruments/"
  @category = "Музыка, искусство -> Музыкальные инструменты"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end

