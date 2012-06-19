# encoding: utf-8

class RealtyIrrRuSectionsPage
  include PageObject

  div :section, :xpath => "//div[./div[./strong[text()='Выберите раздел']]]"

  def has_section(name)
    self.section_element.when_present.
         link_element(:link_text => name).exists?
  end

end
