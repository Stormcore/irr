# encoding: utf-8

class RealtyIrrRuWeekTopicPage
  include PageObject

  div :section do |page|
    page.link_element(:link_text => "Тема недели").parent.parent.parent
  end
  image :topic_picture do |page|
    page.section_element.when_present.image_element
  end
  link :topic_title do |page|
    page.section_element.when_present.h3_element.link_element
  end
  paragraph :topic_text do |page|
    page.section_element.when_present.paragraph_element
  end
end
