# encoding: utf-8

class StargateAdSearchPage
  include PageObject

  text_field :email, xpath: "//div[@class='x-form-item '][.//label[text()='Email:']]//input"
  text_field :id,    xpath: "//div[@class='x-form-item '][.//label[text()='ID:']]//input"
  button :search, text: "Искать"

  def search_for_user_ads(login)
    self.email_element.when_present.value = login
    self.search
  end

  def search_for_ad_by_id(id)
    self.id_element.when_present.value = id
    self.search_element.when_present.click
  end
end

class StargateAdSearchResultsPage
  include PageObject

  div :main, id: "adsfind-search-panel"

  def get_results
    Watir::Wait.until {
      self.main_element.div_element(class: "x-grid3-body").
                      div_elements(class: "x-grid3-row").size > 0
    }
    self.main_element.div_element(class: "x-grid3-body").
                      div_elements(class: "x-grid3-row")
  end

  def open_menu(num)
    self.get_results[num].element.right_click
  end

  def is_deleted?(num)
    self.get_results[num].
         image_element(src: "/img/admin/ico/i-stat4.gif").exists?
  end

  def is_approved?(num)
    self.get_results[num].
         image_element(src: "/img/admin/ico/i-stat1.gif").exists?
  end

  def is_declined?(num)
    self.get_results[num].
         image_element(src: "/img/admin/ico/i-stat2.gif").exists?
  end

  def menu_remove
    self.link_element(text: "Удалить").when_present.click
    self.button_element(text: "Yes").when_present.click
  end

  def menu_edit
    self.link_element(text: "Редактировать").when_present.click
  end

  def menu_approve
    self.link_element(text: "Принять").when_present.click
  end

  def menu_decline
    self.link_element(text: "Отклонить").when_present.click
  end
end

class StargateAdDetailsDialog
  include PageObject

  div :main, class: "x-tab-panel", index: 1

  def open_tab(name)
    self.main_element.when_present
    link = self.main_element.link_element(class: "x-tab-right", text: name)
    link.click if link.exists?
  end

  def get_title
    self.main_element.when_present.element.
         trs.find{|tr| tr.text.include?("Заголовок")}.
             div(class: "x-grid3-col-value").text rescue "nill"
  end

  def is_premium?
    self.main_element.label_element(id: /premiumInfo/).when_present.text != "Не назначено"
  end

end

class StargateAdModerationDeclineDialog
  include PageObject

  div :main, class: "x-window"

  def specify_reason(reason)
    self.main_element.when_present.image_element(class: "x-form-trigger").click
    self.div_element(text: reason).when_present.click
    self.main_element.image_element(class: "x-form-trigger").click
  end

  def set_text(text)
    self.main_element.text_area_element.click
    self.main_element.text_area_element.value = text
  end

  def confirm
    self.main_element.button_element(text: "Отклонить").click
  end

end
