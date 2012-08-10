# encoding: utf-8

class SMSDebugPage
  include PageObject

  direct_url BASE_URL+"/ajax/sms_sender.php"

  text_field :number, name: "isnn"
  text_field :sms_text, name: "text"
  button :submit, value: "send"

  def send_sms(number, text)
    self.number = number
    self.sms_text = text
    self.submit
  end
end

class SMSDebugResponse
  include PageObject

  def get_response
    self.element("pre").exists?
    self.element("pre").text
  end
end

class SMSDebugKZPage
  include PageObject

  direct_url BASE_URL+"/controllers/kz/debug_sms.php"

  text_field :sms_text, name: "sms_text"
  button :submit, value: "Отправить SMS"

  def send_sms(text)
    self.sms_text = text
    self.submit
  end
end

class SMSDebugKZResponse
  include PageObject

  def get_response
    self.element("div").text
  end
end
