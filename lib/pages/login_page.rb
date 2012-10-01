# encoding: utf-8

class LoginPage
  include PageObject

  div :window, id: "dialogAuthWindow"
  text_field :login, name: "login"
  text_field :password, name: "password"
  checkbox :is_remember_me, name: "is_remember_me"
  link :login_button, link_text: "Войти"

  div :error_message, class: "red11"
  div :loader, class: "preload"

  def initialize_page
    self.window_element.when_present
  end

  def login_as(username, password, remember_me)
    self.login = username
    self.password = password
    self.is_remember_me_element.check if remember_me
    self.login_button_element.click
    self.wait_for_loading_screen
  end

  def wait_for_loading_screen
    # Ждём пока все лоадеры станут невидимы
    Watir::Wait.until {
      not self.div_elements(class: "preload").map{|d| d.visible?}.include?(true)
    }
  end

  def has_incorrect_login_message?
    self.error_message_element.when_present.exists?
  end

  def get_incorrect_login_message
    self.error_message_element.text
  end
end
