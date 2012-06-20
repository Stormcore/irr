class PassportPage
  include PageObject

  div :username, :xpath => "//div[@id='popup-wrap']//input[@name='login']"
  link :settings, :href => /myaccount/
  link :logout, :href => /\?logout\=1/

end
