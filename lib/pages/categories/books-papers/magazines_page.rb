# encoding: utf-8

class CategoryBooksPapersMagazinesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/books-papers/magazines/"
  @category = "Книги, учебники, журналы -> Журналы, газеты"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end

