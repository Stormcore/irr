# encoding: utf-8

class CategoryFurnitureInteriorCleaningPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/furniture-interior/cleaning"
  @category = "Мебель, интерьер, обиход -> Товары для уборки дома, бытовая химия"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Вид", "type"
end
