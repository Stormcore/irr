# encoding: utf-8

class AdvertActionConfirmPage
  include PageObject

  link :activate, link_text: "Активировать"

  def select_premium_length(premium_lenght)
    self.div_element(class: "b-period").element.
         b(text: premium_lenght).parent.input.click
  end

  def do_activate
    self.activate_element.when_present.click
  end

end
