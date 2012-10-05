# encoding: utf-8
class MainPage
  include PageObject

  link :login_button, link_text: "Вход"

  list_item :user_name, class: "username"
  list_item :logout, class: "logout"

  table :rubrics, id: "change_main_page_rubric"
  div :makes, id: "makes_main_page"

  div :news, class: "news"
  div :articles, class: "articles"
  div :events, class: "events"

  div :powerseller_section, class: "intpartn"

  link :new_ad, link_text: "Подать объявление"

  def login
    self.login_button.when_present(30).click
  end

  def open_presonal_cabinet
    self.user_name_element.click
  end

  def user_logged_in?
    self.user_name_element.exists?
  end

  def get_logged_in_username
    self.user_name_element.link_element.text
  end

  def has_logout_link?
    self.logout_element.exists?
  end

  def do_logout
    self.logout_element.link_element.click
  end

  def switch_to_category(category)
    self.rubrics_element.link_element(link_text: category).click
  end

  def get_makes_list
    self.makes_element.element.as.map{ |a| a.text}
  end

  def has_news_section?
    self.news_element.exists?
  end

  def get_news
    news = []
    self.news_element.div_elements(class: "news_item").each do |n|
      news_item = {}
      news_item['title'] = n.link_element.text rescue nil
      news_item['image'] = n.image_element.element.src rescue nil
      news_item['description'] = n.element.ps[-2].text rescue nil
      news << news_item
    end
    news
  end

  def has_articles_section?
    self.articles_element.exists?
  end

  def get_articles
    articles = []
    self.articles_element.div_elements(class: "article_item").each do |a|
      article_item = {}
      article_item['title'] = a.link_element.text rescue nil
      article_item['image'] = a.image_element.element.src rescue nil
      article_item['description'] = a.element.ps[-2].text rescue nil
      articles << article_item
    end
    articles
  end

  def has_events_section?
    self.events_element.exists?
  end

  def has_calendar?
    self.events_element.div_element(class: "calendar").exists?
  end

  def has_events_list
    self.events_element.element.dl.exists?
  end

  def get_events_list
    self.events_element.element.dl.dts
  end

  def has_powersellers_section?
    self.powerseller_section_element.exists?
  end

  def get_powersellers
    powersellers = []
    self.powerseller_section_element.element.lis.each do |li|
      powerseller_item = {}
      powerseller_item['title'] = li.link_element.text rescue nil
      powerseller_item['image'] = li.image_element.element.src rescue nil
      powerseller_item['description'] = li.element.ps[-2].text rescue nil
      powerseller_item['ads_count'] = li.element.ps[-1].texts rescue nil
      powersellers << powerseller_item
    end
    powersellers
  end

  def navigate_to_new_ad
    self.new_ad
  end

end
