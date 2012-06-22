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
  pending # express the regexp above with the code you wish you had
end

Допустим /^я сохраняю введенный примиум$/ do
  pending # express the regexp above with the code you wish you had
end

То /^на БО показано диалоговое окно "(.*?)"$/ do |dialog_title|
  pending # express the regexp above with the code you wish you had
end

Когда /^я закрываю диалоговое окно$/ do
  pending # express the regexp above with the code you wish you had
end
