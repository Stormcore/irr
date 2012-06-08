# encoding: utf-8

class CategoryArtsMusicCollectionsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/arts-music/collections/"
  @category = "Музыка, искусство -> Коллекционирование"

  irr_multi_select "Тип предложения", "offertype"
end

