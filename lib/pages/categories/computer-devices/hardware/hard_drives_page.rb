# encoding: utf-8

class CategoryComputerHardwareHardDrivesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/hardware/hard_drives"
  @category = "Компьютерная техника -> Комплектующие -> Жесткие диски"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_range_select "Емкость, Гб", "hdd_size"
  irr_multi_select "Тип", "type"
end
