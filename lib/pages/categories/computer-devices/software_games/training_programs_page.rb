# encoding: utf-8

class CategoryComputerSoftwareTrainingPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/software_games/training_programs"
  @category = "Компьютерная техника -> Программное обеспечение и игры -> Обучающие и справочные программы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
