# encoding: utf-8

Допустим %{я запоминаю сумму значений в выпадающем меню в секции "$section"} do |section|
  on CategoriesBarPage do |page|
    @sum = 0
    page.open_popup_for_section(section)
    page.get_categories_list.each do |category|
      @sum += page.get_counter_value(category).to_i
    end
  end
end

Допустим %{я запоминаю сумму значений в выпадающем меню последней категории} do
  last_category = @category_name.split(" -> ")[-1]
  steps %Q{* я запоминаю сумму значений в выпадающем меню в секции "#{last_category}"}
end

Допустим %{сумма равна значению счетчика в выпадающем меню в секции "$section"} do |section|
  on CategoriesBarPage do |page|
    page.open_popup_for_section(section)
    page.get_counter_value(section).to_i.should eq(@sum)
  end
end

Допустим %{сумма равна значению счетчика в выпадающем меню в предпоследней категории} do
  prelast_category = @category_name.split(" -> ")[-2]
  steps %Q{* сумма равна значению счетчика в выпадающем меню в секции "#{prelast_category}"}
end

Допустим %{я запоминаю значение счетчика в выпадающем меню для секции "$section"} do |section|
  on CategoriesBarPage do |page|
    page.open_popup_for_section(section)
    @counter = page.get_counter_value(section)
  end
end

Допустим %{я запоминаю значение счетчика для последней категории в выпадающем меню} do
  last_category = @category_name.split(" -> ")[-1]
  steps %Q{* я запоминаю значение счетчика в выпадающем меню для секции "#{last_category}"}
end

Допустим %{на странице результатов количество результатов равно значению счетчика из выпадающего меню} do
  on SearchResultsPage do |page|
    page.get_number_of_found_results.to_i.should eq(@counter.to_i)
  end
end
