# encoding: utf-8

class CategoryComputerHardwareDVDPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/hardware/dvd"
  @category = "Компьютерная техника -> Комплектующие -> Blu-ray, CD-, DVD- и FDD-приводы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
