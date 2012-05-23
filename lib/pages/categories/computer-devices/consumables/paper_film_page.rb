# encoding: utf-8

class CategoryComputerConsumablesPaperFilmPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/consumables/paper_film"
  @category = "Компьютерная техника -> Расходные материалы -> Бумага и пленка"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
