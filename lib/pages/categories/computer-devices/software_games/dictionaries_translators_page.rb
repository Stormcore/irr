# encoding: utf-8

class CategoryComputerSoftwareDictionariesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/software_games/dictionaries_translators"
  @category = "Компьютерная техника -> Программное обеспечение и игры -> Словари и переводчики"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
