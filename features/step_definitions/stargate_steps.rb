# encoding: utf-8

Когда %{я перехожу на страницу stargate} do
  visit StargateLoginPage
end

То %{показано сообщение "$message"} do |message|
  on StargateLoginPage do |page|
    begin
      @browser.alert.text.should == message
    ensure
      @browser.alert.ok
    end
  end
end

Когда %{на stargate я вхожу под логином "$login" и паролем "$password"} do |login, password|
  visit StargateLoginPage do |page|
    page.logout if page.has_logout
  end

  visit StargateLoginPage do |page|
    page.login = login
    page.password = password
    page.enter
  end
end

То %{отображена основная страница БО} do
  on StargatePage do |page|
    page.westpanel_element.when_present
  end
end

Допустим /^на БО я перехожу в категорию "(.*?)"$/ do |long_category|
  last_category = nil
  on StargateNavigationPage do |page|
    long_category.split(' -> ').each do |category|
      page.expand_directory category
      last_category = category
    end
  end
  # Открываем созданную
  on StargateTabListPage do |page|
    page.switch_to_tab(last_category)
  end
end

Допустим /^на странице создания нового премиума в БО я выбираю категорию "(.*?)"$/ do |long_category|
  on StargateNewPremiumPage do |page|
    last_category = nil
    long_category.split(' -> ').each do |category|
      page.expand_category category
      last_category = category
    end
    # Даблклик по последней категории
    page.double_click last_category
  end
end

Допустим /^при создании премиума я ввожу следующие данные:$/ do |table|
  # table is a Cucumber::Ast::Table
  on StargateNewPremiumDataPage do |page|
    table.hashes.each do |hash|
      puts "Устанавливаем значение #{hash['parameter']} = #{hash['value']}"
      page.set_value(hash['parameter'], hash['value'], hash['type'])
    end
  end
end

Допустим /^при создании премиума я выбираю "(.*?)"$/ do |premium_length|
  on StargateNewPremiumDataPage do |page|
    page.set_premium_period(premium_length)
  end
end

Допустим /^я сохраняю введенный примиум$/ do
  on StargateNewPremiumDataPage do |page|
    page.save_premium
  end
end

То /^на БО показано диалоговое окно "(.*?)"$/ do |dialog_title|
  on StargateNewPremiumDataPage do |page|
    page.has_dialog_window.should eq(true)
  end
end

Когда /^я закрываю диалоговое окно$/ do
  on StargateNewPremiumDataPage do |page|
    page.close_dialog_window
  end
end

Когда /^на БО я добавляю интернет\-партнеру пакет "(.*?)" для региона "(.*?)" со следующими параметрами:$/ do |arg1, arg2, table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Когда /^на БО я добавляю (\d+) поднятий на пакет "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Когда /^на БО я добавляю (\d+) выделений на пакет "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Когда /^на БО я удаляю пакет "(.*?)" у интернет\-партнера$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end