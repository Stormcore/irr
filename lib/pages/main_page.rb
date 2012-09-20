# encoding: utf-8
class MainPage
  include PageObject

  link :selected_region, xpath: "//ul[@class='choose-region']/li/a"
  link :login, id: "a_login"
  span :logged_in, id: "passport_userInfo"
  
  link :personal_cabinet, id: "load_user_ads_counter"
  link (:favourites) {|page| page.list_item_element(id: "blocknote").link_element}
  
  link (:adverts_my) {|page| page.span_element(id: "user_ads_counter").when_present.parent}
  link :adverts_favourites, link_text: "Избранные"
  link :adverts_payments, link_text: "Платежи"
  link :adverts_profile, link_text: "Профиль"
  div :popupLoading, id: "popup-loading"


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

  def expand_personal_cabinet_popup
    unless self.span_element(id: "user_ads_counter").visible?
      self.personal_cabinet_element.when_visible.click 
    end
    Watir::Wait.until { not self.popupLoading_element.div_element.visible?}
  end

  def open_my_adverts
    self.expand_personal_cabinet_popup
    self.adverts_my_element.when_present.click
  end
  
  def open_favourite_adverts
    self.expand_personal_cabinet_popup
    self.adverts_favourites.when_visible.click
  end
  
  def open_payments
    self.expand_personal_cabinet_popup
    self.adverts_payments.when_visible.click
  end
  
  def open_profile
    self.expand_personal_cabinet_popup
    self.adverts_profile.when_visible.click
  end

  def get_user_ads_count
    self.expand_personal_cabinet_popup
    ad_count = self.adverts_my_element.span_element.text
    # Нажимаем по комбобоксу чтобы закрыть попап
    self.only_title_element.check
    ad_count
  end
end
