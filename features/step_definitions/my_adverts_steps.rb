# encoding: utf-8
Когда %{объявление с названием "$title" присутствует в списке} do |title|
  on MyAdvertsPage do |page| 
    page.tabs.when_present
  end
end
