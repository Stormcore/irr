# encoding: utf-8

class SMSDebugPage
  include PageObject

  text_field :sms_text, name: "sms_text"
  button :submit, value: "Отправить SMS"

  def send_sms(text)
    self.sms_text = text
    self.submit
  end
end

class SMSDebugResponse
  include PageObject

  def get_response
    self.div_element.when_present.text
  end
end
