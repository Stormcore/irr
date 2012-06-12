# encoding: utf-8

class CategoryOtherOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/other/other"
  @category = "Другое -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
