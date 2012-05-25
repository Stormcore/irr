# encoding: utf-8

class CategoryBuildingProtectionPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/building/protection"
  @category = "Строительство и ремонт -> Средства индивидуальной защиты"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
