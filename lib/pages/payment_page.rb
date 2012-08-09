# encoding: utf-8

class PaymentOptionsPage
  include PageObject

  label :sms, text: "SMS"

  link :paymentOK, id: "paymentOk"
  span :paymentText, id: "paymentText"
  span :paymentPhone, id: "paymentPhone"

  def select_sms
    self.sms_element.element.input.click
    unless self.element("strong").exists?
      # Нажимаем отправить и берем данные из открывающегося окна
      self.paymentOK
    end
  end

  def get_sms_text
    if self.element("strong").exists?
      self.element("strong").text
    else
      self.paymentText
    end
  end

  def get_sms_number
    if self.element("strong", index: 1).exists?
      self.element("strong", index: 1).text
    else
      self.paymentPhone
    end
  end
end
