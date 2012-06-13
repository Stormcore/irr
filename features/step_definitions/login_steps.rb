# encoding: utf-8

Когда %{я вхожу под пользователем с ролью "$role"} do |role|
  case role
  when "Обычный пользователь"
    steps %Q{When я вхожу под пользователем "auto_test" с паролем "testtest"}
  when "Интернет-партнер"
    steps %Q{When я вхожу под пользователем "kruglova" с паролем "111111"}
  else
    fail "Нет такой роли - '#{role}'"
  end
end

Когда %{я вхожу под пользователем "$login" с паролем "$password"} do |login, password|
  on MainPage do |page| 
    page.logout if page.logged_in?
    page.login
  end

  on LoginPage do |page|
    page.login_as(login, password, true)
    @current_user_name = login
  end
end

То %{на главной странице отображено имя пользователя} do 
  on MainPage do |page|
    page.logged_in_element.when_present.text.should == @current_user_name 
  end
end

То %{на главной странице отображена ссылка на личный кабинет} do 
  on MainPage do |page|
    element = page.personal_cabinet_element.when_present
    element.visible?.should == true
    element.text.strip.should == "Личный кабинет"
  end
end

То %{на главной странице отображена ссылка на избранное} do 
  on MainPage do |page|
    element = page.favourites_element.when_present
    element.visible?.should == true
    element.text.should match "Избранное"
  end
end

То %{на главной странице отображена ссылка на выход} do 
  on MainPage do |page|
    element = page.logout_element.when_present
    element.visible?.should be true
    element.text.should == "Выйти"
  end
end

То %{на главной странице отображены ссылки для пользователя} do
  steps %Q{* на главной странице отображено имя пользователя}
  steps %Q{* на главной странице отображена ссылка на личный кабинет}
  steps %Q{* на главной странице отображена ссылка на выход}
end

Когда %{я перехожу на страницу паспорта} do
  visit PassportPage
end

То %{на странице паспорта отображено имя пользователя} do 
  on PassportPage do |page|
    element = page.div_element(:text => /#{@current_user_name}/)
    element.when_present.visible?.should == true
  end
end

То %{на странице паспорта отображена ссылка на настройки} do 
  on PassportPage do |page|
    element = page.settings_element.when_present
    element.visible?.should == true
    element.text.should match "Настройки"
  end
end

То %{на странице паспорта отображена ссылка на выход} do 
  on PassportPage do |page|
    element = page.logout_element.when_present
    element.visible?.should be true
    element.text.should == "Выйти"
  end
end

То %{на странице паспорта отображены ссылки для пользователя} do
  steps %Q{* на странице паспорта отображено имя пользователя}
  steps %Q{* на странице паспорта отображена ссылка на настройки}
  steps %Q{* на странице паспорта отображена ссылка на выход}
end


Когда %{я перехожу на страницу автомобильного портала} do
  @browser.goto BASE_URL.gsub(/http\:\/\//, "http://auto.")
end

Когда %{я перехожу на страницу портала недвижимости} do
  @browser.goto BASE_URL.gsub(/http\:\/\//, "http://realty.")
end
