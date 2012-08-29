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

Допустим %{в ЛК ИП я запоминаю количество счетчика для категории "$category"} do |category|
  on PSellerCategoriesPage do |page|
    @counter = page.get_counter_for_category(category)
    puts "Значение счетчика: #{@counter}"
  end
end

Допустим /^в ЛК ИП счетчик для категории "(.*)" (увеличился|уменьшился) на (.+)$/ do |category, clause, value|
  on PSellerCategoriesPage do |page|
    new_value = page.get_counter_for_category(category)
    puts "Новое значение счетчика: #{new_value}"
    if clause == "увеличился"
      (new_value.to_i - @counter.to_i).should eq(1)
    else
      (@counter.to_i - new_value.to_i).should eq(1)
    end
  end
  steps %{* в ЛК ИП я запоминаю количество счетчика для категории "#{category}"}
end

Допустим /^в ЛК ИП счетчик для категории "(.*)" не изменился$/ do |category|
  on PSellerCategoriesPage do |page|
    page.get_counter_for_category(category).should eq(@counter)
  end
end
