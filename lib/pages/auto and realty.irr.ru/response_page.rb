# encoding: utf-8

class AutoIrrRuResponsePage
  include PageObject

  div :section, xpath: "//div[./div[@class='s-title']" +
                          "[.//strong[text()='Отзывы']]]"
  
  def get_response_items
    self.section_element.element.div(class: "b-responseAnons").divs(class: "rows")
  end

  def response_item_stars_count(element)
    element.when_present.divs(class: "ico-activ").size
  end

  def response_item_has_link(element)
    element.when_present.a.exists?
  end

  def response_item_get_model(element)
    element.when_present.div(class: "h2").text
  end
end
