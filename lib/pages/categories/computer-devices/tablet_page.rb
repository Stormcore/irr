# encoding: utf-8

class CategoryComputerDevicesTabletPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/tablet/"
  @category = "Компьютерная техника -> Планшеты"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_range_select "Диагональ экрана", "pad_display_diagonal"
  irr_range_select "Объем встроенной памяти", "memory_pad"
  irr_checkbox     "Мультитач", "multituch_pad"
  irr_checkbox     "Bluetooth", "bluetooth_pad"
  irr_checkbox     "3G", "3g_pad"
  irr_single_select "Операционная система", "os_pad"
  irr_range_select "Вес", "weight_pad"

  def get_parameter(field)
    case field
    when "Диагональ экрана"
      super(field).gsub(/ "/, '')
    when "Объем встроенной памяти"
      super(field).gsub(/ Гб/, '')
    else
      super(field)
    end
  end
end
