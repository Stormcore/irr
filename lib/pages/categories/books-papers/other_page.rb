# encoding: utf-8

class CategoryBooksPapersOtherPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/books-papers/other/"
  @category = "Книги, учебники, журналы -> Другое"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end

