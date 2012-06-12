# encoding: utf-8

class CategoryOtherAdultPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/other/adult"
  @category = "Другое -> Товары для взрослых"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
