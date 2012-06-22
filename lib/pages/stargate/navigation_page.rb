# encoding: utf-8

class StargateNavigationPage
  include PageObject

  div :main, :xpath => "//div[@class='x-panel x-panel-noborder'][.//span[text()='Навигация']]"

  def expand_directory(element=nil,name)
    element = self.main_element if element.nil?
    element.span_element(:text => name).click
  end

end