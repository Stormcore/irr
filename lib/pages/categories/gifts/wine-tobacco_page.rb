# encoding: utf-8

class CategoryGiftsWineTobaccoPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/gifts/wine-tobacco"
  @category = "Праздники и подарки -> Принадлежности для спиртного и аксессуары для курения"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Тип", "cfd_tobacco_type"
end
