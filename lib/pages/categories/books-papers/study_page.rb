# encoding: utf-8

class CategoryBooksPapersStudyPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/books-papers/study/"
  @category = "Книги, учебники, журналы -> Учебная литература"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end

