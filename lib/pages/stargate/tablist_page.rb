# encoding: utf-8

class StargateTabListPage
  include PageObject

  div :main, class: "x-tab-panel-header"

  def get_tab_list
    debugger
    1
  end

  def switch_to_tab(name)
    self.main_element.element.li(text: name).click
  end

end
