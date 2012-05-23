# encoding: utf-8

class CategoryComputerFlashDrivesUSBFlashDisksPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/flash_drives/usb_flash_disks"
  @category = "Компьютерная техника -> Flash-накопители -> USB flash-диски"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_range_select "Объем памяти, Мб", "flash_size"
end
