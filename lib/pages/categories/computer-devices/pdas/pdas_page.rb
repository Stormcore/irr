# encoding: utf-8

class CategoryComputerDevicesPDAsPDAPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/pdas_communicators/"
  @category = "Компьютерная техника -> КПК -> КПК"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Новый или подержанный", "used-or-new"
  irr_multi_select "Модель", "make"
  irr_multi_select "Тип ОС", "os"
  irr_checkbox "Wi-Fi", "wifi"
  irr_checkbox "GPS", "gps"

end
