# encoding: utf-8

class CategoryArtsMusicArtsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/arts-music/arts/"
  @category = "Музыка, искусство -> Произведения искусства и антиквариат"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end

