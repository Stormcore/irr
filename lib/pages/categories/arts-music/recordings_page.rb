# encoding: utf-8

class CategoryArtsMusicRecordingsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/arts-music/instruments/"
  @category = "Музыка, искусство -> Аудио-, видеозаписи"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип", "type"
end

