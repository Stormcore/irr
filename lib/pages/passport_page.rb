class PassportPage
  include PageObject

  div :popupWrap, id: "popup-wrap"
  div (:username)  {|page| page.popupWrap_element.div_element(name:'login')}
  link :settings, href: /myaccount/
  link :logout, href: /\?logout\=1/

end
