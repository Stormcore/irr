# encoding: utf-8

class StargatePage
  include PageObject

  div :westpanel, id: "west-panel"
  div :docbody, id: "doc-body"

  def open_category(path)
    debugger
    1
  end
end
