# encoding: utf-8

class CategoryFurnitureInteriorComputerTablesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/computer-tables"
  @category = "Мебель, интерьер, обиход -> Компьютерные столы и кресла"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
  irr_multi_select "Материал", "material"
end
