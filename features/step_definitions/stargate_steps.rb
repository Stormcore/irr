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
  puts "DEBUG: Логин: #{credentials['login']}, пароль #{credentials['password']}"
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
    Watir::Wait.until {page.enter_element.enabled?}
    sleep 1
    page.enter_element.click
  end
end

То %{отображена основная страница БО} do
  on StargatePage do |page|
    Watir::Wait.until { @browser.alert.exists? || page.westpanel_element.exists?}
    raise "Ошибка на странице: '#{@browser.alert.text}'" if @browser.alert.exists?
  end
end

Допустим %{на БО я перехожу в категорию "$long_category"} do |long_category|
  @dont_do_the_double_click = true
  last_category = nil
  on StargateNavigationPage do |page|
    long_category.split(' -> ').each do |category|
      sleep 1
      page.expand_directory category
      last_category = category
    end
  end
  # Открываем созданную
  on StargateTabListPage do |page|
    page.switch_to_tab(last_category)
  end
end

Допустим %{я созданию новое объявление в БО} do
  @dont_do_the_double_click = false
  on StargateCatalogSelectPage do |page|
    page.create_new_advert
  end
end

Допустим %{на странице дерева объявлений в БО я выбираю категорию "$long_category"} do |long_category|
  on StargateCatalogSelectPage do |page|
    last_category = nil
    long_category.split(' -> ').each do |category|
      page.expand_category category
      last_category = category
    end
    # Даблклик по последней категории
    page.double_click last_category
  end
end

Допустим /^при создании объявления я ввожу следующие данные:$/ do |table|
  on StargateNewAdDataPage do |page|
    table.hashes.each do |hash|
      puts "Устанавливаем значение #{hash['parameter']} = #{hash['value']}"
      page.set_value(hash['parameter'], hash['value'], @dont_do_the_double_click)
    end
  end
end

Допустим %{при создании объявления я указываю владельца пользователя с ролью "$role"} do |role|
  credentials = get_login_and_password_for_role(role)
  on StargateNewAdDataPage do |page|
    page.set_value("Владелец объявления", credentials['email'], @dont_do_the_double_click)
  end
end

Допустим %{при создании премиума я выбираю "$premium_length"} do |premium_length|
  on StargateNewPremiumDataPage do |page|
    page.set_premium_period(premium_length)
  end
end

Допустим %{при создании объявления я перехожу на вкладку "Изображения" и загружаю картинку} do
  on StargateNewAdDataPage do |page|
    page.go_to_tab("Изображения")
  end
  steps %Q{* при создании объявления я загружаю картинку}
end

Допустим %{при создании объявления я загружаю картинку} do
  on StargateNewAdDataPage do |page|
    page.upload_picture
  end
end

Допустим %{я сохраняю введенное объявление} do
  on StargateNewAdDataPage do |page|
    page.save_ad
  end
end

То %{на БО показано диалоговое окно "$dialog_title"} do |dialog_title|
  on StargateNewAdDataPage do |page|
    page.has_dialog_window.should eq(true)
  end
end

Когда %{я закрываю диалоговое окно} do
  on StargateNewAdDataPage do |page|
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
  @details_opened = false
  on StargatePowersellerDetailsPage do |page|
    @details_opened = page.main_element.element.wd.location.x > 0
  end

  unless @details_opened
    on StargatePowersellersPage do |page|
      page.open_details_for_first_found_result
    end
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

    page.set_parameter("Номер счета пакета", "123")
    page.set_combobox_value("Статус оплаты", "пробное")

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

Когда /^на БО я удаляю все пакеты "(.*)"$/ do |package|
  on StargatePowersellerDetailsPage do |page|
    page.open_tab("Пакеты")
    while page.has_package(package) do
      page.delete_package(package)
    end
    page.save
    page.close
  end
end

Допустим /^на БО я активирую пакет "(.*)"$/ do |package|
  on StargatePowersellerDetailsPage do |page|
    page.open_tab("Пакеты")
    unless page.has_package(package)
      steps %Q{
        * на БО я добавляю интернет-партнеру пакет "#{package}" для региона "Вся Россия"
      }
    else
      unless page.is_package_active(package)
        steps %Q{
          * на БО я удаляю все пакеты "#{package}"
          * на БО я добавляю интернет-партнеру пакет "#{package}" для региона "Вся Россия"
        }
      end
    end
  end
end

Когда /^на БО у пользователя роли "(.*)" я удаляю все пакеты "(.*)"$/ do |role, package|
  steps %Q{
    * на БО я ищу пользователя с ролью "#{role}"
    * на БО я открываю детали интернет\-партнера
    * на БО я удаляю все пакеты "#{package}"
  }
end

Когда %{на БО я делаю интернет-партнеру $num премиумов на $period дней} do |num, period|
  steps %Q{* на БО я открываю детали интернет-партнера}
  on StargatePowersellerDetailsPage do |page|
    page.open_tab("Премиум")
    current_premium_count = page.get_premium_number(period)
    delta = num.to_i - current_premium_count
    page.set_premium_count(delta, period) unless delta == 0
    page.save
    page.close
  end

end
