# encoding: utf-8

class CategoryComputerSoftwareWebDesignPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/software_games/web_design"
  @category = "Компьютерная техника -> Программное обеспечение и игры -> Веб-дизайн"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
