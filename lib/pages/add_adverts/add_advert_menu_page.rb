# encoding: utf-8
class AddAdvertMenuPage
  include PageObject

  direct_url BASE_URL+"/advertSubmission/step1/"

  link :addOnlineAdvert, link_text: /Подать объявление на сайт/

end
