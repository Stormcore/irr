# encoding: utf-8

class CategoryComputerHardwareSoundCardsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/hardware/sound_cards"
  @category = "Компьютерная техника -> Комплектующие -> Звуковые карты"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип", "type"
end
