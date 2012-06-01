# encoding: utf-8

class CategoryBusinessTaraMaterialsGoodsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/tara-materials/goods"
  @category = "Бизнес и партнерство -> Сырье, тара, товары оптом -> Товары оптом"

  irr_multi_select "Тип предложения", "offertype"
end
