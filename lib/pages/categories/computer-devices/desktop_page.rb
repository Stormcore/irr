# encoding: utf-8

class CategoryComputerDevicesDesktopsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/desktops/"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Новый или подержанный", "used-or-new"

end
