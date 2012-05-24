# encoding: utf-8

class CategoryPhotoOpticsMicroscopesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/optics/microscopes/"
  @category = "Фото, оптика -> Оптика -> Микроскопы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
