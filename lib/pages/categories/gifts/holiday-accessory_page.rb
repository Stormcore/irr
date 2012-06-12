# encoding: utf-8

class CategoryGiftsHolidayAccessoryPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/gifts/holiday-accessory"
  @category = "Праздники и подарки -> Праздничные аксессуары"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Тип", "cfd_holiday_accessories_type"
end
