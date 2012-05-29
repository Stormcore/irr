# encoding: utf-8

class CategoryGardenFireplaceOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/garden/fireplace/other"
  @category = "Все для дачи -> Камины, печи -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
