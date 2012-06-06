# encoding: utf-8

class CategoryArtsMusicServicePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/arts-music/service/"
  @category = "Музыка, искусство -> Реставрация и сервис"

  irr_multi_select "Тип предложения", "offertype"
end

