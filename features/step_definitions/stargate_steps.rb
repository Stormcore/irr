# encoding: utf-8
То %{показано сообщение "$message"} do |message|
  on StargateLoginPage do |page|
    begin
      @browser.alert.text.should == message
    ensure
      @browser.alert.ok
    end
  end
end

Когда %{я перехожу на БО} do
  credentials = get_login_and_password_for_role("Пользователь БО")
  steps %Q{
    * на stargate я вхожу под логином "#{credentials['login']}" и паролем "#{credentials['password']}"
    * отображена основная страница БО
  }
end

Когда %{на stargate я вхожу под логином "$login" и паролем "$password"} do |login, password|
  visit StargateLoginPage do |page|
    page.logout if page.logout?
  end

  visit StargateLoginPage do |page|
    page.login_element.when_present.value = login
    page.password_element.when_present.value = password
    page.enter
  end
end

То %{отображена основная страница БО} do
  on StargatePage do |page|
    page.westpanel_element.when_present(30)
  end
end

Допустим %{на БО я перехожу в категорию "$long_category"} do |long_category|
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

Допустим %{на странице создания нового премиума в БО я выбираю категорию "$long_category"} do |long_category|
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
      page.set_value(hash['parameter'], hash['value'])
    end
  end
end

Допустим %{при создании премиума я указываю владельца пользователя с ролью "$role"} do |role|
  credentials = get_login_and_password_for_role(role)
  on StargateNewPremiumDataPage do |page|
    page.set_value("Владелец объявления", credentials['email'])
  end
end

Допустим %{при создании премиума я выбираю "$premium_length"} do |premium_length|
  on StargateNewPremiumDataPage do |page|
    page.set_premium_period(premium_length)
  end
end

Допустим %{я сохраняю введенный примиум} do
  on StargateNewPremiumDataPage do |page|
    page.save_premium
  end
end

То %{на БО показано диалоговое окно "$dialog_title"} do |dialog_title|
  on StargateNewPremiumDataPage do |page|
    page.has_dialog_window.should eq(true)
  end
end

Когда %{я закрываю диалоговое окно} do
  on StargateNewPremiumDataPage do |page|
    page.close_dialog_window
  end
end

Допустим %{на БО я ищу пользователя с ролью "$role"} do |role|
  powerseller_login = get_login_and_password_for_role(role)['login']
  on StargatePowersellersPage do |page|
    page.search_for_powerseller(powerseller_login)
  end
end

Допустим %{на БО я открываю детали интернет-партнера} do
  on StargatePowersellersPage do |page|
    page.open_details_for_first_found_result
  end
end

Допустим %{на БО я открываю форму добавления пакета} do
  on StargatePowersellerDetailsPage do |page|
    page.open_tab("Пакеты")
    page.add_package
  end
end

Допустим %{на БО я открываю форму редактирования пакета "$package"} do |package|
  on StargatePowersellerDetailsPage do |page|
    page.edit_package(package)
  end
end

Когда %{на БО я добавляю интернет\-партнеру пакет "$package" для региона "$region"} do |package, region|
  steps %Q{
    * на БО я добавляю интернет-партнеру пакет "#{package}" для региона "#{region}" со следующими параметрами:
    | поле | значение |
  }
end

Когда /^на БО я добавляю интернет\-партнеру пакет "(.*?)" для региона "(.*?)" со следующими параметрами:$/ do |package, region, params|
  steps %q{
    * на БО я открываю детали интернет-партнера
    * на БО я открываю форму добавления пакета
  }
  # Указываем детали пакета
  on StargatePowersellerDetailsPackagesTabPage do |page|
    page.set_combobox_value("Вид пакета", region)
    page.set_combobox_value("Пакет", package)

    # Заполняем параметры
    params.hashes.each do |hash|
      page.set_parameter(hash['поле'], hash['значение'])
    end

    page.save
  end
end

Когда %{на БО я добавляю $num поднятий на пакет "$package"} do |num, package|
  steps %Q{
    * на БО я открываю форму редактирования пакета "#{package}"
  }

  on StargatePowersellerDetailsPackagesTabPage do |page|
    page.set_parameter("Поднятий", num)
    page.save
  end
end

Когда %{на БО я добавляю $num выделений на пакет "$package"} do |num, package|
  steps %Q{
    * на БО я открываю форму редактирования пакета "#{package}"
  }
  on StargatePowersellerDetailsPackagesTabPage do |page|
    page.set_parameter("Выделений", num)
    page.save
  end
end

Когда %{на БО я добавляю $num просмотров на пакет "$package"} do |num, package|
  steps %Q{
    * на БО я открываю форму редактирования пакета "#{package}"
  }
  on StargatePowersellerDetailsPackagesTabPage do |page|
    page.set_parameter("Просмотров", num)
    page.save
  end
end

Когда %{на БО я удаляю пакет "$package" у интернет-партнера} do |package|
  on StargatePowersellerDetailsPage do |page|
    page.delete_package(package)
    page.save
  end
end

Когда %{на БО я удаляю все пакеты "$package" у пользователя роли "$role"} do |package, role|
  steps %Q{
    * на БО я ищу пользователя с ролью "#{role}"
    * на БО я открываю детали интернет\-партнера
  }
  on StargatePowersellerDetailsPage do |page|
    page.open_tab("Пакеты")
    while page.has_package(package) do
      page.delete_package(package)
    end
    page.save
  end

end
