# encoding: utf-8

class CategoryComputerSoftwareProgrammingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/software_games/programming"
  @category = "Компьютерная техника -> Программное обеспечение и игры -> Программирование"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
