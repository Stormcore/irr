# encoding: utf-8
class MainPage
  include PageObject

  link :login, link_text: "Вход"

  list_item :user_name, class: "username"
  list_item :logout, class: "logout"

  def user_logged_in?
    self.user_name_element.exists?
  end

  def get_logged_in_username
    self.user_name_element.link_element.text
  end

  def has_logout_link?
    self.logout_element.exists?
  end

  def do_logout
    self.logout_element.link_element.click
  end
end
