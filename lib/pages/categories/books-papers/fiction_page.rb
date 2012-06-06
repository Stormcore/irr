# encoding: utf-8

class CategoryBooksPapersFictionPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/books-papers/fiction/"
  @category = "Книги, учебники, журналы -> Художественная литература"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end

