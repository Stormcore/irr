# encoding: utf-8

class CategoryComputerSoftwareGamesPCPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/software_games/pc_games"
  @category = "Компьютерная техника -> Программное обеспечение и игры -> Игры для PC"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
