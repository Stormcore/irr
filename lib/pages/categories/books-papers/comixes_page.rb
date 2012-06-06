# encoding: utf-8

class CategoryBooksPapersComixesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/books-papers/comixes/"
  @category = "Книги, учебники, журналы -> Альбомы и комиксы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end

