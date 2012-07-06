# encoding: utf-8

class MyAdvertsSettingsTabPage
  include PageObject

  def has_section_displayed(name)
    case name
    when "Пакеты партнёра"
      self.span_element(text: "Вы приобрели пакет Интернет-партнера со следующими параметрами:").when_present.exists?
    else
      self.span_element(text: name).when_present.exists?
    end
  end
end
