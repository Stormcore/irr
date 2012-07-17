# encoding: utf-8

class CategoryCarsRepaymentSearchPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/repayment"
  @category = "Авто и мото -> Выкуп автомобилей. Спрос"

  irr_multi_select "Тип автомобиля", "type"
  irr_multi_select "Состояние", "condition"
  irr_multi_select "Автомобили", "madein"

end
