# encoding: utf-8

class StargateLoginPage
  include PageObject

  direct_url BASE_URL+"/stargate"

  text_field :login, :name => "login"
  text_field :password, :name => "password"
  button     :enter, :text => "Войти"

  link :logout, :link_text => "Выйти"

  def has_logout
    begin
      self.logout_element.when_present.exists?
    rescue Watir::Wait::TimeoutError => e
      return false
    end
  end
end
