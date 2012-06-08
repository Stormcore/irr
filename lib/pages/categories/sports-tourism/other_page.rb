# encoding: utf-8

class CategorySportsTourismOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/sports-tourism/other"
  @category = "Спорт, туризм, отдых -> Другое"

  irr_multi_select "Тип предложения", "offer"
  irr_multi_select "Состояние", "used-or-new"
end

