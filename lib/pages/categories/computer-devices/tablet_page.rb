# encoding: utf-8

class CategoryComputerDevicesTabletPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/tablet/"
  @category = "Компьютерная техника -> Планшеты"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Новый или подержанный", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_range_select "Диагональ экрана, дюймы", "pad_display_diagonal"
  irr_range_select "Объем встроенной памяти, Гб", "memory_pad"
  irr_checkbox     "Мультитач", "multituch_pad"
  irr_checkbox     "Bluetooth", "bluetooth_pad"
  irr_checkbox     "3G", "3g_pad"
  irr_single_select "Операционная система", "os_pad"
  irr_range_select "Вес", "weight_pad"
end
