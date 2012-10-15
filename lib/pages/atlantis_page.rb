# encoding: utf-8

class AtlantisLoginPage
  include PageObject

  def login_as login, password
    self.text_field_element(name: "login").value = login
    self.text_field_element(name: "password").value = password
    self.text_field_element(name: "password").send_keys "\n"
  end

end

class AtlantisMainPage
  include PageObject

  def wait_for_page_to_be_opened
    Watir::Wait.until {self.div_element(id: "north").exists?}
  end

  def open_category category
    self.div_element(class: "x-tree-root-node").
         link_element(class: "x-tree-node-anchor", text: category).
            when_present.click
  end

end
