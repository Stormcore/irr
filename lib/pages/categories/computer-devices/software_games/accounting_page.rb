# encoding: utf-8

class CategoryComputerSoftwareAccountingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/software_games/accounting"
  @category = "Компьютерная техника -> Программное обеспечение и игры -> Бухгалтерия"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
