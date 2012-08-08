# encoding: utf-8

class PaymentOptionsPage
  include PageObject

  label :sms, text: "SMS"

  def select_sms
    self.sms_element.element.input.click
  end
end
