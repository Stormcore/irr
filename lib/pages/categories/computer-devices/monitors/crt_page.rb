# encoding: utf-8

class CategoryComputerDevicesMonitorsCRTPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/monitors/lcd"
  @category = "Компьютерная техника -> Мониторы -> ЭЛТ"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_range_select "Диагональ экрана", "diagonal"

  def get_parameter(field)
    if field == "Диагональ экрана"
      super(field).gsub(/ дюймов/, '')
    else
      super(field)
    end
  end

end
