# encoding: utf-8
module Rent
  include PageObject
  
  div :currency, :xpath => "//div[@class='price_combo']/div[@class='lbl']"
  div :time, :class => "b-bFloat"
  
  def set_rent_parameter(hash)
    case hash['parameter']
    when "Валюта"
      linkcombo(self.currency_element, "popupComboPriceCurrency", hash['value'])

    when "Срок сдачи"
      linkcombo(self.time_element, "popupComboPricePeriod", hash['value'])
    end
  end

end