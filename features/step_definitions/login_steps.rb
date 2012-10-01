# encoding: utf-8

Когда %{я вхожу под пользователем с логином "$login" и паролем "$password"} do |login,password|
  steps %Q{
    * я перехожу к окну логина
    * я ввожу логин "#{login}" и пароль "#{password}"
  }
end

Когда %{я выхожу из текущего пользователя} do
  on MainPage do |page|
    page.do_logout if page.user_logged_in?
  end
end

Когда %{я перехожу к окну логина} do
  steps %Q{* я выхожу из текущего пользователя}
  on MainPage do |page| 
    page.login
  end
end

Когда %{я ввожу логин "$login" и пароль "$password"} do |login, password|
  @current_user_name = login
  on LoginPage do |page|
    page.login_as(login, password, true)
  end
end

Допустим %{на странице логина показано сообщение о том, что такого пользователя не существует} do
  on LoginPage do |page|
    page.has_incorrect_login_message?.should eq(true), "Сообщение не показано"
    page.get_incorrect_login_message.should eq("Неверный логин или пароль.")
  end
end

То %{на главной странице отображено имя пользователя} do
  on MainPage do |page|
    page.get_logged_in_username.should == @current_user_name
  end
end

То %{на главной странице отображена ссылка на выход} do
  on MainPage do |page|
    page.has_logout_link?.should eq(true), "Нет ссылки на выход"
  end
end
