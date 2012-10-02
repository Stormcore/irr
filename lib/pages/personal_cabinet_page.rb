# encoding: utf-8
class PersonalCabinetPage
  include PageObject

  div :title, class: "title"

  def is_displayed?
    self.title?
  end

  def has_ad_with_title? title
    debugger
    has_ad_with_title? title
  end

  def get_ad_id_for_title title
    debugger
    get_ad_id_for_title title
  end

  def get_price ad_id
    debugger
    get_price ad_id
  end

  def get_region ad_id
    debugger
    get_region ad_id
  end

  def get_status ad_id
    debugger
    get_status ad_id
  end

end
