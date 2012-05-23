# encoding: utf-8

class CategoryComputerHardwareVideocardsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/hardware/video_cards"
  @category = "Компьютерная техника -> Комплектующие -> Видеокарты"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип разъема", "connector_type"
  irr_multi_select "Линейка видеопроцессора", "line_vpu"
end
