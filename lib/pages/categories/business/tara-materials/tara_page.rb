# encoding: utf-8

class CategoryBusinessTaraMaterialsTaraPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/tara-materials/tara"
  @category = "Бизнес и партнерство -> Сырье, тара, товары оптом -> Инвентарь, тара"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Вид тары", "tara_type"
end
