# encoding: utf-8

class CategoryBusinessTaraMaterialsOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/tara-materials/other"
  @category = "Бизнес и партнерство -> Сырье, тара, товары оптом -> Другое"

  irr_multi_select "Тип предложения", "offertype"
end
