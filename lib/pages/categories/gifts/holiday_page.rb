# encoding: utf-8

class CategoryGiftsHolidayPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/gifts/holiday"
  @category = "Праздники и подарки -> Тематические подарки"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Тип", "cfd_holiday_type"
end
