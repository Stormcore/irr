# encoding: utf-8

class CategoryGiftsHolidayAccessoryPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/gifts/holiday-accessory"
  @category = "Праздники и подарки -> Праздничные аксессуары"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Тип", "cfd_card_type"
end
