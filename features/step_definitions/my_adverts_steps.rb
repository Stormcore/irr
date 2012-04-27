# encoding: utf-8
Когда %{объявление с названием "$title" присутсвует в списке} do |title|
  on MyAdvertsPage do |page| 
    page.tabs.when_present
  end
end
