# encoding: utf-8

Когда %{я вхожу под обычным пользователем} do
  steps %Q{When я вхожу под пользователем "auto_test" с паролем "testtest"}
end

Когда %{я вхожу под интернет-партнером} do
  steps %Q{When я вхожу под пользователем "kruglova" с паролем "111111"}
end

Когда %{я вхожу под пользователем "$login" с паролем "$password"} do |login, password|
  on MainPage do |page| 
    page.logged_in? ? (page.logout) : (page.login)
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
    element.text.should == "Личный кабинет"
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
