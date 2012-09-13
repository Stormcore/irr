# encoding: utf-8
class MainPage
  include PageObject

  link :selected_region, xpath: "//ul[@class='choose-region']/li/a"
  link :login, id: "a_login"
  span :logged_in, id: "passport_userInfo"
  
  link :personal_cabinet, id: "load_user_ads_counter"
  link (:favourites) {|page| page.list_item_element(id: "blocknote").link_element}
  
  link (:adverts_my) {|page| page.span_element(id: "user_ads_counter").parent}
  link :adverts_favourites, link_text: "Избранные"
  link :adverts_payments, link_text: "Платежи"
  link :adverts_profile, link_text: "Профиль"
  
  link :logout, id: "logout"
  
  link :add_advert, link_text: "подать объявление бесплатно"
  
  checkbox :only_title, name: "only_title"
  div :find_div, class: "button-style"
  button :find, class: "button"
  text_field :keywords, id: "keywords"
  
  div :sidebar, class: "b-sidebar"
  unordered_list (:top_categories) {|page| sidebar_element.unordered_list_element}

  def get_logged_in_user_name
    self.unordered_list_element(class: "header_autorizationLink").
         list_item_element(index: 2).text
  end

  def select_category(category)
    if category.split(" -> ").size == 1
      self.div_element(class: "b-rubricate_item_title", text: category).link_element.click
    else
      top_category = category.split(" -> ")[0]
      sub_category = category.split(" -> ")[1]
      top_title = self.div_element(class: "b-rubricate_item_title", text: top_category)
      raise "Не найдена родительская категория #{top_category}" unless top_title.exists?
      sub_category_element = top_title.parent.unordered_list_element.
                                       link_element(link_text: sub_category)
      raise "Не найдена категория #{sub_category} в категории '#{top_category}'" unless sub_category_element.exists?
      sub_category_element.click
    end
  end
  
  def search_for(keywords)
    self.keywords = keywords
    self.find
  end
  
  def open_my_adverts
    self.personal_cabinet_element.when_visible.click unless self.adverts_my_element.visible?
    self.adverts_my_element.when_present.click
  end
  
  def open_favourite_adverts
    self.personal_cabinet_element.when_visible.click unless self.adverts_my_element.visible?
    self.adverts_favourites.when_visible.click
  end
  
  def open_payments
    self.personal_cabinet_element.when_visible.click unless self.adverts_my_element.visible?
    self.adverts_payments.when_visible.click
  end
  
  def open_profile
    self.personal_cabinet_element.when_visible.click unless self.adverts_my_element.visible?
    self.adverts_profile.when_visible.click
  end

  def get_user_ads_count
    self.personal_cabinet_element.when_visible.click unless self.adverts_my_element.visible?
    ad_count = self.adverts_my_element.span_element.text
    # Нажимаем по комбобоксу чтобы закрыть попап
    self.only_title_element.check
    ad_count
  end
end
