# encoding: utf-8

class RealtyIrrRuStoriesPage
  include PageObject

  div :section, :xpath => "//div[./div[@class='s-title']" +
                          "[.//a[text()='Статьи']]]"
  
  link :all_stories do |page|
    page.section_element.link_element(:text => "Все статьи")
  end

  def get_stories_items
    self.section_element.element.divs(:class => "wr-b-News")
  end

  def story_item_has_link(element)
    element.when_present.a.exists?
  end

  def story_item_has_picture(element)
    element.when_present.img.exists?
  end

  def story_item_has_text(element)
    element.when_present.p.exists?
  end
end
