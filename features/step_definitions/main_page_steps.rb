# encoding: utf-8
Допустим %{на главной странице показан регион "$region"} do |region|
  on MainPage do |page| page.selected_region_element.text.should == region end
end

Если %{я указываю искать только в заголовках объявления} do
  on MainPage do |page| page.only_title_element.when_present.check end
end

Если %{я ищу "$keywords"} do |keywords|
  @keywords = keywords
  on MainPage do |page|
    page.search_for(keywords)
  end
end

Когда %{я перехожу в список моих объявлений} do
  on MainPage do |page|
    page.open_my_adverts
  end
end
