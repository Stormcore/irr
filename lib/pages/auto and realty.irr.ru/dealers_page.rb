# encoding: utf-8

class AutoIrrRuDealersPage
  include PageObject

  div :section, :xpath => "//div[./div[@class='h1']" +
                          "[.//a[text()='Автосалоны, дилеры']]]"
  
  def get_dealer_items
    self.section_element.element.divs(:class => "wr-salonDiller")
  end

  def dealer_item_has_link(element)
    element.when_present.a.exists?
  end

  def dealer_item_has_picture(element)
    element.when_present.img.exists?
  end
end
