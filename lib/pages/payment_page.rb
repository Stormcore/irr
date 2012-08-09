# encoding: utf-8

class PaymentOptionsPage
  include PageObject

  label :sms, text: "SMS"

  def select_sms
    self.sms_element.element.input.click
  end

  def get_sms_text
    self.element("strong").text
  end
end
