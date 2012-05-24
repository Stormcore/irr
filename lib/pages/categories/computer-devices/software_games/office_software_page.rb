# encoding: utf-8

class CategoryComputerSoftwareOfficeSoftwarePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/software_games/office_software"
  @category = "Компьютерная техника -> Программное обеспечение и игры -> Системные и офисные программы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
