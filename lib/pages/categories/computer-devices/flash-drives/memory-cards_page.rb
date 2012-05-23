# encoding: utf-8

class CategoryComputerFlashDrivesMemoryCardsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/flash_drives/memory_cards"
  @category = "Компьютерная техника -> Flash-накопители -> Карты памяти"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип карты", "type"
  irr_range_select "Объем памяти, Мб", "flash_size"
end
