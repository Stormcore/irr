# encoding: utf-8

class CategoryComputerSoftwareAntivirusesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/software_games/antiviruses"
  @category = "Компьютерная техника -> Программное обеспечение и игры -> Антивирусы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
