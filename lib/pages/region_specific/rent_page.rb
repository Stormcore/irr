# encoding: utf-8
module Rent
  include PageObject

  irr_link_select "Валюта",     "//div[@class='price_combo']/div[@class='lbl']", "popupComboPriceCurrency"
  irr_link_select "Срок сдачи", "//div[@class='b-bFloat']", "popupComboPricePeriod"
  
  def set_rent_parameter(hash)
    setter_functions = Rent.instance_variable_get(:@setter_functions)
    self.send "#{setter_functions[hash['parameter']]}", hash
  end
  
  def get_rent_parameter(field)
    self.send("#{Rent.instance_variable_get(:@getter_functions)[field]}")
  end
end
