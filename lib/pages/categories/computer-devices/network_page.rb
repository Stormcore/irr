# encoding: utf-8

class CategoryComputerNetworkPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/computers-devices/network"
  @category = "Компьютерная техника -> Сетевое оборудование"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Тип", "type"
  irr_checkbox     "Беспроводное оборудование", "wireless"
end
