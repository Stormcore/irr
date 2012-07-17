# encoding: utf-8

class CategoryComputerDevicesPDAsPDAPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/pdas_communicators/pda"
  @category = "Компьютерная техника -> КПК -> КПК"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип ОС", "os"
  irr_checkbox "Wi-Fi", "wifi"
  irr_checkbox "GPS", "gps"

end
