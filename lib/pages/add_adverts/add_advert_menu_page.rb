# encoding: utf-8
class AddAdvertMenuPageNew
  include PageObject

  direct_url BASE_URL+"/advertSubmission/step1/"

  link :addOnlineAdvert, link_text: /Подать объявление на сайт/

end

class AddAdvertMenuPage
  include PageObject

  link :addOnlineAdvert, link_text: /Подать объявление на сайт/

end
