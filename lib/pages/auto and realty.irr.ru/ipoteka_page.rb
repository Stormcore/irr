# encoding: utf-8

class RealtyIrrRuIpotekaPage
  include PageObject

  div :section, :xpath => "//div[./div[@class='s-title']" +
                          "[.//a[text()='Ипотечные программы банков']]]"

  table :ipoteka, :class => "b-banks"
  link :all_banks, :text => "Все банки"

  def get_bank_size
    self.ipoteka_element.when_present.rows
  end

  def get_bank_name(element)
    element.element.td(:index => 0).a.text
  end

  def get_percents(element)
    element.element.td(:index => 1).text
  end
end
