# encoding: utf-8
class MyAdvertsPage
  include PageObject

  unordered_list :tabs, :class => "b-bookmarks"
  unordered_list :statuses, :xpath => "//div[@class='b-blockInf'][contains(.,'Статус')]//ul"
  unordered_list :categories, :xpath => "//div[@class='b-blockInf'][contains(.,'Категории')]//ul"
end
