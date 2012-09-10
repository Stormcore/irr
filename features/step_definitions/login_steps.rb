# encoding: utf-8

def get_login_and_password_for_role(role)
  credentials = YAML::load(File.open(File.dirname(__FILE__)+'/../credentials.yml'))
  record_name = BASE_URL.gsub("http://",'')
  raise "Пароли и логины не найдены для данного сервера" unless credentials.has_key?(record_name)
  @passport_address = credentials[record_name]['passport_address']
  credentials[record_name][role]
end

Когда %{я ввожу логин и пароль роли "$role"} do |role|
  credentials = get_login_and_password_for_role(role)
  puts "DEBUG: Логин: #{credentials['login']}, пароль '#{credentials['password']}'"
  steps %Q{
    * я ввожу логин "#{credentials['login']}" и пароль "#{credentials['password']}"
  }
  @current_user_name = credentials['username']
end

Когда %{я вхожу под пользователем с ролью "$role"} do |role|
  on MainPage do |page|
    @current_user_name = page.get_logged_in_user_name if page.logout?
  end
  expected_credentials = get_login_and_password_for_role(role)
  raise "Нет такой роли" if expected_credentials.nil?
  unless expected_credentials['username'] == @current_user_name
    steps %Q{* я перехожу к окну логина}
    steps %Q{* я ввожу логин и пароль роли "#{role}"}
  end

end

Когда %{я выхожу из текущего пользователя} do
  on MainPage do |page|
    page.logout if page.logout?
  end
end

Когда %{я перехожу к окну логина} do
  steps %Q{* я выхожу из текущего пользователя}
  full_url = construct_region_url(BASE_URL, @region)
  puts "DEBUG: Переходим на <a href='#{full_url}'>#{full_url}</a>"
  @browser.goto(full_url)
  on MainPage do |page| 
    page.login
  end
end

Когда %{я ввожу логин "$login" и пароль "$password"} do |login, password|
  on LoginPage do |page|
    page.login_as(login, password, true)
  end
end

Допустим %{на странице логина показано сообщение о том, что такого пользователя не существует} do
  on LoginPage do |page|
    page.incorrect_login_message?.should eq(true), "Сообщение не показано"
    page.incorrect_login_message.should eq("Введен неверный логин или пароль")
  end
end

Допустим %{на странице логина показано сообщение о том, что пользователь не активен} do
  on LoginPage do |page|
    page.inactive_user_message?.should eq(true), "Сообщение не показано"
    page.inactive_user_message.should eq("Ваша учетная запись зарегистрирована, но не активирована.\nВыслать письмо активации еще раз.")
    page.inactive_user_link?.should eq(true), "Отсутствует ссылка на повторное письмо об активации"
  end
end

Допустим %{на странице логина показано сообщение о том, что пользователь заблокирован} do
  on LoginPage do |page|
    page.inactive_irr_user_message?.should eq(true), "Сообщение не показано"
    page.inactive_irr_user_message.should eq("Ваш аккаунт заблокирован. Пожалуйста, свяжитесь со службой поддержки по e-mail: support@irr.ru")
    page.support?.should eq(true), "Отсутствует ссылка на адрес поддержки"
    page.support_element.element.text.should eq("support@irr.ru")
    page.support_element.element.href.should eq("mailto:support@irr.ru")
  end
end

То %{на главной странице отображено имя пользователя} do 
  on MainPage do |page|
    page.get_logged_in_user_name.should == @current_user_name
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
  puts "DEBUG: Переходим на <a href='#{@passport_address}'>#{@passport_address}</a>"
  @browser.goto @passport_address
end

То %{на странице паспорта отображено имя пользователя} do 
  on PassportPage do |page|
    div = page.div_elements(class: "b_li").find{ |div| div.element.b.exists?}
    div.nil?.should eq(false), "Имя пользователя не найдено"
    div.element.b.text.should == @current_user_name
  end
end

То %{на странице паспорта отображена ссылка на настройки} do 
  on PassportPage do |page|
    element = page.settings_element
    element.visible?.should == true
    element.text.should match "Настройки"
  end
end

То %{на странице паспорта отображена ссылка на выход} do 
  on PassportPage do |page|
    element = page.logout_element
    element.visible?.should be true
    element.text.should == "Выйти"
  end
end

То %{на странице паспорта отображены ссылки для пользователя} do
  steps %Q{* на странице паспорта отображено имя пользователя}
  steps %Q{* на странице паспорта отображена ссылка на настройки}
  steps %Q{* на странице паспорта отображена ссылка на выход}
end
