# encoding: utf-8

class CategoryComputerDevicesMonitorsLCDPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/monitors/lcd"
  @category = "Компьютерная техника -> Мониторы -> LCD (ЖК)"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_range_select "Диагональ экрана, дюймы", "diagonal"

end
