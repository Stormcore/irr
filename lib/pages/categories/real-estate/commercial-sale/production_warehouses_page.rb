# encoding: utf-8

class CategoryRealEstateCommercialsaleProductionWarehousesPage < AdDetailsPage
  include PageObject
  include CityWithMetro

  @@url_suffix = "/real-estate/commercial-sale/production-warehouses"
  @category = "Недвижимость -> Коммерческая. Продажа -> Производство и склады"

  irr_single_select "Назначение помещения", "warehouse_type_object"
  irr_range_select  "Общая площадь", "square-min"
  irr_text_field    "Высота потолков", "house-ceiling-height"
  
  irr_checkbox      "Отапливаемое", "heating2"
  irr_checkbox      "Охрана", "security"
  irr_checkbox      "Ж/д пути", "railway"
  irr_range_select  "Подключенная мощность", "electro"
end
