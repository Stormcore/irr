# encoding: utf-8
Когда %{объявление с названием "$title" присутствует в списке} do |title|
  on MyAdvertsPage do |page|
    @ad_index = page.get_ad_with_title(title)
    @ad_index.should > 0
  end
end

То %{у объявления указан регион "$region"} do |region|
  on MyAdvertsPage do |page|
    page.get_region(@ad_index).should == region
  end
end

То %{у объявления указан город "$city"} do |city|
  on MyAdvertsPage do |page|
    page.get_city(@ad_index).should == city
  end
end

То %{у объявления указана цена "$price" в $currency} do |price, currency|
  on MyAdvertsPage do |page|
    case currency
    when "рублях"
      page.get_price(@ad_index, "RUR").gsub(/руб./, '').should == price
    when "долларах"
      page.get_price(@ad_index, "USD").gsub(/\$/, '').should == price
    when "евро"
      page.get_price(@ad_index, "EUR").gsub(/€/, '').should == price
    end
  end
end

Когда %{я открываю детали этого объявления} do
  on MyAdvertsPage do |page|
    page.open_ad(@ad_index)
  end
end

То %{на вкладке "Все" "$field" $operator "$expected"} do |field, operator, expected|
  on @category_page do |page|
    actual_value = page.get_parameter(field)
    case operator
    when "равно одному из"
      expected.split(', ').should include actual_value
    when "равно"
      actual_value.should == expected 
    when "в границах"
      expected_array = expected.split(" - ")
      actual_value.to_i.should be >= expected_array[0].to_i
      actual_value.to_i.should be <= expected_array[1].to_i
    when "содержит"
      actual_value.should include(expected)
    else
      eval("actual_value.to_i.should be #{operator} expected.to_i")
    end
  end
end
