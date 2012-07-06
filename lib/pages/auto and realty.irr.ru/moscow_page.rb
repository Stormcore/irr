# encoding: utf-8

class RealtyIrrRuMoscowPage
  include PageObject

  div :section, xpath: "//div[./div[@class='s-title']" +
                          "[.//a[text()='Районы Москвы']]]"

  def map_displayed?
    self.section_element.when_present.element.embed.exists?
  end
end
