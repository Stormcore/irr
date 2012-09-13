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

  div :recently_viewed_section, class: "b-recently-look"
  unordered_list :recently_viewed_list, id: "recently-look-items"
  div :carousel, class: "caroufredsel_wrapper"
  div :next_button, id: "next_button"
  div :prev_button, id: "prev_button"
  link :clear_recently_viewed, id: "clear-last-show-adverts"

  def get_recently_viewed_detail(index, parameter)
    element = self.recently_viewed_list_element.list_item_element(index: index)
    case parameter
    when "photo"
      element.element.img.src
    when "title"
      element.element.h3.a.text
    when "price"
      element.element.p.text.split(" ")[0..-2].join(" ")
    when "currency"
      element.element.p.text.split(" ")[-1]
    when "URL"
      element.element.h3.a.href
    end
  end

  def get_recently_viewed_urls
    self.recently_viewed_list_element.element.lis.map{|li| li.h3.a.href}
  end

  def is_recently_viewed_item_visible(url)
    max = self.carousel_element.element.wd.location.x +
          self.carousel_element.element.wd.size.width
    min = self.carousel_element.element.wd.location.x
    current_pos = self.recently_viewed_list_element.element.lis.find{|li| 
                       li.h3.a.href == url}.wd.location.x
    puts "min=#{min} current_pos=#{current_pos} max=#{max}"
    current_pos >= min and current_pos <= max
  end

  def get_recently_viewed_displayed_number
    # определяем количество отображенных объявлений
    # раз это всё li, то visible? не катит
    # определяем так - они должны быть в рамках карусели
    max = self.carousel_element.element.wd.location.x +
          self.carousel_element.element.wd.size.width
    min = self.carousel_element.element.wd.location.x

    puts "min=#{min} max=#{max}"
    puts "#{self.recently_viewed_list_element.element.lis.map{|li| li.element.wd.location.x}}"
    self.recently_viewed_list_element.element.lis.select{|li| 
      li.element.wd.location.x >= min and 
      li.element.wd.location.x <= max 
    }.size
  end

  def get_recently_viewed_scroll_state(direction)
    case direction
    when "вправо"
      self.next_button_element.div_element.visible?
    when "влево"
      self.prev_button_element.div_element.visible?
    end
  end

  def recently_viewed_scroll_click(direction)
    case direction
    when "вправо"
      self.next_button_element.div_element.click
    when "влево"
      self.prev_button_element.div_element.click
    end
  end

  def get_recently_viewed_number
    self.recently_viewed_list_element.element.lis.size
  end

  def has_recently_viewed_section
    self.recently_viewed_section?
  end

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
