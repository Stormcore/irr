# encoding: utf-8

class CategoryComputerSoftwareOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/software_games/other_software"
  @category = "Компьютерная техника -> Программное обеспечение и игры -> Другое ПО"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
