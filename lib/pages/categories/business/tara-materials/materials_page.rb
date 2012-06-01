# encoding: utf-8

class CategoryBusinessTaraMaterialsMaterialsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/tara-materials/materials"
  @category = "Бизнес и партнерство -> Сырье, тара, товары оптом -> Сырье, вторичная переработка"

  irr_multi_select "Тип предложения", "offertype"
end
