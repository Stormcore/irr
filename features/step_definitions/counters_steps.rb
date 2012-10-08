# encoding: utf-8

Допустим %{я запоминаю количество объявлений пользователя} do
  on MainPage do |page|
    @total_ads_num = page.get_user_ads_count
    puts "'Мои объявления' количество: #{@total_ads_num}"
  end
end

Допустим %{в списке ИП для пользователя с ролью "$role" указано правильное количество объявлений} do |role|
  on PowersellersListPage do |page|
    credentials = get_login_and_password_for_role(role)
    raise "Пароли и логины не найдены для данного сервера" unless credentials.has_key?('username')
    name = credentials['username']
    powerseller = page.get_powerseller_by_name(name)
    new_value = powerseller.get_counter
    new_value.to_i.should eq(@active_ads_num.to_i)
  end
end

def assert_value_changed actual, expected, value1, value2, clause
  case clause
  when /увеличился на/
    actual.to_i.should eq(expected.to_i + value1.to_i)
  when /уменьшился на/
    delta = expected.to_i - value2.to_i
    unless delta < 0
      actual.to_i.should eq(delta)
    else
      actual.to_i.should eq(0)
    end
  when "не изменился"
    actual.to_i.should eq(expected.to_i)
  else
    raise "Неизвестное условие: '#{clause}'"
  end
end

Допустим /^счетчик объявлений пользователя (увеличился на (.*)|уменьшился на (.*)|не изменился)$/ do |clause, value1, value2|
  on MainPage do |page|
    new_value = page.get_user_ads_count
    puts "'Мои объявления' новое количество: #{new_value}"
    assert_value_changed new_value, @total_ads_num, value1, value2, clause
  end
end

Допустим /^я запоминаю количество активных объявлений (ИП|ОП)$/ do |type|
  classs = type == 'ИП' ? PackageInfoPage : OPPackageInfoPage
  on classs do |page|
    @active_ads_num = page.get_active_counter
    puts "'Размещено' количество: #{@active_ads_num}"
  end
end

Допустим /^я запоминаю количество неактивных объявлений (ИП|ОП)$/ do |type|
  classs = type == 'ИП' ? PackageInfoPage : OPPackageInfoPage
  on classs do |page|
    @inactive_ads_num = page.get_inactive_counter
    puts "'Неактивно' количество: #{@inactive_ads_num}"
  end
end

Допустим /^счетчик количества активных объявлений продавца (увеличился на (.*)|уменьшился на (.*)|не изменился)$/ do |clause, value1, value2|
  on AdDetailsPage do |page|
    new_value = page.get_seller_ad_count
    puts "'Все объявления продавца' новое количество: #{new_value}"
    assert_value_changed new_value, @active_ads_num, value1, value2, clause
  end
end

Допустим /^счетчик количества размещенных объявлений в ЛК (ИП|ОП) (увеличился на (.*)|уменьшился на (.*)|не изменился)$/ do |type, clause, value1, value2|
  classs = type == 'ИП' ? PackageInfoPage : OPPackageInfoPage
  on classs do |page|
    new_value = page.get_active_counter
    puts "'Размещено' новое количество: #{new_value}"
    assert_value_changed new_value, @active_ads_num, value1, value2, clause
  end
end

Допустим /^счетчик количества неактивных объявлений в ЛК (ИП|ОП) (увеличился на (.*)|уменьшился на (.*)|не изменился)$/ do |type, clause, value1, value2|
  classs = type == 'ИП' ? PackageInfoPage : OPPackageInfoPage
  on classs do |page|
    new_value = page.get_inactive_counter
    puts "'Неактивно' новое количество: #{new_value}"
    assert_value_changed new_value, @inactive_ads_num, value1, value2, clause
  end
end

Допустим %{я жду $timeout секунд и перезагружаю страницу} do |timeout|
  # Счетчик запаздывает - ждём #{timeout} секунд и обновляем страницу
  sleep timeout.to_i
  @browser.refresh
end

Допустим /^счетчик объявлений (ИП|ОП) во всех разделах (увеличился на (.*)|уменьшился на (.*)|не изменился)$/ do |type, clause, value1, value2|
  classs = type == 'ИП' ? PSellerCategoriesPage : OPAdvertsPage
  on classs do |page|
    steps %{* я жду 10 секунд и перезагружаю страницу}
    new_value = page.get_counter_for_all_categories
    puts "'Все разделы' новое значение: #{new_value}"
    assert_value_changed new_value, @total_ads_num, value1, value2, clause
  end
end

Допустим %{я запоминаю сумму значений в выпадающем меню в секции "$section"} do |section|
  on CategoriesBarPage do |page|
    @sum = 0
    page.open_popup_for_section(section)
    page.get_categories_list().each do |category|
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

Допустим %{я запоминаю сумму значений счетчиков для последней категории в выпадающем меню} do
  last_category = @category_name.split(" -> ")[-1]
  steps %Q{* я запоминаю сумму значений в выпадающем меню в секции "#{last_category}"}
end

Допустим %{на странице результатов количество результатов равно значению счетчика из выпадающего меню} do
  on SearchResultsPage do |page|
    page.get_number_of_found_results.to_i.should eq(@counter.to_i)
  end
end

Допустим /^в ЛК (ИП|ОП) я запоминаю значение счетчика для категории "(.*)"$/ do |type, long_category|
  classs = type == 'ИП' ? PSellerCategoriesPage : OPAdvertsPage
  on classs do |page|
    # В хэше сохраняем значения для всех категорий - включая корневые
    @counter = {}
    long_category.split(" -> ").each do |category|
      @counter[category] = page.get_counter_for_category(category)
    end
    puts "Значение счетчика: #{@counter}"
  end
end

Допустим /^в ЛК (ИП|ОП) счетчик для категории "(.*)" (увеличился на (.+)|уменьшился на (.+)|не изменился)$/ do |type, category, clause, value1, value2|
  classs = type == 'ИП' ? PSellerCategoriesPage : OPAdvertsPage
  on classs do |page|
    @counter.each do |category, expected_counter|
      new_value = page.get_counter_for_category(category)
      puts "Новое значение счетчика для категории '#{category}': #{new_value}"
      assert_value_changed new_value, expected_counter, value1, value2, clause
    end
  end
end
