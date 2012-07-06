# encoding: utf-8

class RealtyIrrRuExpertInterviewPage
  include PageObject

  div :section do |page|
    page.link_element(link_text: "Интервью с экспертами").parent.parent.parent
  end
  image :interview_picture do |page|
    page.section_element.when_present.image_element
  end
  link :interview_title do |page|
    page.section_element.when_present.h3_element.link_element
  end
  paragraph :interview_text do |page|
    page.section_element.when_present.paragraph_element
  end
end
