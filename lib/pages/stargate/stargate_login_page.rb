# encoding: utf-8

class StargateLoginPage
  include PageObject

  direct_url BASE_URL+"/stargate"

  text_field :login, name: "login"
  text_field :password, name: "password"
  button     :enter, text: "Войти"

  link :logout, link_text: "Выход"
end
