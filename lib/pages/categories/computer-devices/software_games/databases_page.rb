# encoding: utf-8

class CategoryComputerSoftwareDatabasesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/software_games/databases"
  @category = "Компьютерная техника -> Программное обеспечение и игры -> Базы данных"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
