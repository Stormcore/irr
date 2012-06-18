# encoding: utf-8

class AdvertActionConfirmPage
  include PageObject

  link :activate, :link_text => "Активировать"

  def do_activate
    self.activate_element.when_present.click
  end

end
