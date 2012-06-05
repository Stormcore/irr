# encoding: utf-8

class CategoryFurnitureInteriorHomeStuffTextilesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/home-stuff/dishes"
  @category = "Мебель, интерьер, обиход -> Предметы обихода -> Посуда"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
end
