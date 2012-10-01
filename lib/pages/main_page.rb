# encoding: utf-8
class MainPage
  include PageObject

  link :login, link_text: "Вход"

  list_item :user_name, class: "username"
  list_item :logout, class: "logout"

  table :rubrics, id: "change_main_page_rubric"
  div :makes, id: "makes_main_page"

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

  def switch_to_category(category)
    self.rubrics_element.link_element(link_text: category).click
  end

  def get_makes_list
    self.makes_element.element.as.map{ |a| a.text}
  end
end
