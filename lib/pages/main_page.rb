# encoding: utf-8
class MainPage
  include PageObject

  link :selected_region, xpath: "//ul[@class='choose-region']/li/a"
  link :login, id: "a_login"
  span :logged_in, id: "passport_userInfo"
  
  link :personal_cabinet, link_text: /Личный кабинет/
  link :favourites, link_text: /Избранное/
  
  link :adverts_my, link_text: /Мои объявления/
  link :adverts_favourites, link_text: "Избранные"
  link :adverts_payments, link_text: "Платежи"
  link :adverts_profile, link_text: "Профиль"
  
  link :logout, link_text: "Выйти"
  
  link :add_advert, link_text: "Подать объявление"
  
  checkbox :only_title, name: "only_title"
  div :find_div, class: "button-style"
  link (:find) {|page| page.find_div_element.when_present.link_element}
  text_field :keywords, id: "id_keywords"
  
  div :sidebar, class: "b-sidebar"
  unordered_list (:top_categories) {|page| sidebar_element.unordered_list_element}

  def select_top_category(category)
    category_link = self.top_categories_element.link_element(link_text: /#{category}/)
    category_link.when_present.click
  end
  
  def search_for(keywords)
    self.keywords = keywords
    self.find
  end
  
  def open_my_adverts
    #self.personal_cabinet_element.when_visible.click
    #self.adverts_profile.when_visible.click
    self.personal_cabinet_element.when_present.click
    self.adverts_my_element.when_present.click
  end
  
  def open_favourite_adverts
    self.personal_cabinet_element.when_visible.click
    self.adverts_favourites.when_visible.click
  end
  
  def open_payments
    self.personal_cabinet_element.when_visible.click
    self.adverts_payments.when_visible.click
  end
  
  def open_profile
    self.personal_cabinet_element.when_visible.click
    self.adverts_profile.when_visible.click
  end
end
