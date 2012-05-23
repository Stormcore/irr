# encoding: utf-8

class CategoryComputerFlashDrivesCardreadersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/flash_drives/card_readers"
  @category = "Компьютерная техника -> Flash-накопители -> Кард-ридеры"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
