# encoding: utf-8
module Rent
  include PageObject
  
  irr_link_select "Валюта",     "//div[@class='price_combo']/div[@class='lbl']", "popupComboPriceCurrency"
  irr_link_select "Срок сдачи", "//div[@class='b-bFloat']", "popupComboPricePeriod"
end