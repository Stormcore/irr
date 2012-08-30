# encoding: utf-8

Допустим %{я запоминаю количество объявлений пользователя} do
  on MainPage do |page|
    @total_ads_num = page.get_user_ads_count
    puts "'Мои объявления' количество: #{@total_ads_num}"
  end
end

Допустим /^счетчик объявлений пользователя (увеличился на (.*)|уменьшился на (.*)|не изменился)$/ do |clause, value, not_used|
  on MainPage do |page|
    new_value = page.get_user_ads_count
    puts "'Мои объявления' новое количество: #{new_value}"
    @total_ads_num = 0 if @total_ads_num.nil?
    case clause
    when /увеличился на/
      @total_ads_num.to_i.should eq(new_value.to_i - value.to_i)
    when /уменьшился на/
      @total_ads_num.to_i.should eq(new_value.to_i + value.to_i)
    when "не изменился"
      @total_ads_num.should eq(new_value)
    else
      raise "Неизвестное условие: '#{clause}'"
    end
  end
end

Допустим %{я запоминаю количество активных объявлений ИП} do
  on PackageInfoPage do |page|
    @active_ads_num = page.get_ad_field_value("Размещено")
    puts "'Размещено' количество: #{@total_ads_num}"
  end
end

Допустим /^счетчик количества активных объявлений продавца (увеличился на (.*)|уменьшился на (.*)|не изменился)$/ do |clause, value, not_used|
  on AdDetailsPage do |page|
    new_value = page.get_seller_ad_count
    puts "'Все объявления продавца' новое количество: #{new_value}"
    @active_ads_num = 0 if @active_ads_num.nil?
    case clause
    when /увеличился на/
      @active_ads_num.to_i.should eq(new_value.to_i - value.to_i)
    when /уменьшился на/
      @active_ads_num.to_i.should eq(new_value.to_i + value.to_i)
    when "не изменился"
      @active_ads_num.should eq(new_value)
    else
      raise "Неизвестное условие: '#{clause}'"
    end
  end
end

Допустим /^счетчик количества размещенных объявлений в ЛК ИП (увеличился на (.*)|уменьшился на (.*)|не изменился)$/ do |clause, value, not_used|
  on PackageInfoPage do |page|
    new_value = page.get_ad_field_value("Размещено")
    puts "'Размещено' новое количество: #{new_value}"
    @total_ads_num = 0 if @total_ads_num.nil?
    case clause
    when /увеличился на/
      @total_ads_num.to_i.should eq(new_value.to_i - value.to_i)
    when /уменьшился на/
      @total_ads_num.to_i.should eq(new_value.to_i + value.to_i)
    when "не изменился"
      @total_ads_num.should eq(new_value)
    else
      raise "Неизвестное условие: '#{clause}'"
    end
  end
end

Допустим /^счетчик объявлений во всех разделах (увеличился на (.*)|уменьшился на (.*)|не изменился)$/ do |clause, value, not_used|
  on PSellerCategoriesPage do |page|
    new_value = page.get_counter_for_category("Все разделы")
    puts "'Все разделы' новое значение: #{new_value}"
    @active_ads_num = 0 if @active_ads_num.nil?
    case clause
    when /увеличился на/
      @active_ads_num.to_i.should eq(new_value.to_i - value.to_i)
    when /уменьшился на/
      @active_ads_num.to_i.should eq(new_value.to_i + value.to_i)
    when "не изменился"
      @active_ads_num.should eq(new_value)
    else
      raise "Неизвестное условие: '#{clause}'"
    end
  end
end

Допустим %{я запоминаю сумму значений в выпадающем меню в секции "$section"} do |section|
  on CategoriesBarPage do |page|
    @sum = 0
    page.open_popup_for_section(section)
    page.get_categories_list.each do |category|
      @sum += page.get_counter_value(category).to_i
    end
  end
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

Допустим %{в ЛК ИП я запоминаю значение счетчика для категории "$category"} do |long_category|
  on PSellerCategoriesPage do |page|
    # В хэше сохраняем значения для всех категорий - включая корневые
    @counter = {}
    long_category.split(" -> ").each do |category|
      @counter[category] = page.get_counter_for_category(category)
    end
    puts "Значение счетчика: #{@counter}"
  end
end

Допустим /^в ЛК ИП счетчик для категории "(.*)" (увеличился на (.+)|уменьшился на (.+)|не изменился)$/ do |category, clause, value, not_used|
  on PSellerCategoriesPage do |page|
    @counter.each do |category, expected_counter|
      new_value = page.get_counter_for_category(category)
      puts "Новое значение счетчика для категории '#{category}': #{new_value}"

      case clause
      when /увеличился на/
        (new_value.to_i - expected_counter.to_i).should eq(1)
      when /уменьшился на/
        (expected_counter.to_i - new_value.to_i).should eq(1)
      when "не изменился"
        new_value.should eq(expected_counter)
      else
        raise "Неизвестное условие: '#{clause}'"
      end
    end
  end
end
