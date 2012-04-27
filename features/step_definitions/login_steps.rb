# encoding: utf-8
Когда %{я вхожу под доверенным пользователем} do
  on MainPage do |page| 
    if page.logged_in
      page.do_logout
    else
      page.open_login_form
    end
  end

  on LoginPage do |page|
    page.login_as("vrutkovsky", "worksucks", true)
    @current_user_name = "vrutkovsky"
  end
end

То %{на главной странице отображено имя пользователя} do 
  on MainPage do |page| 
    page.current_user_name_element.when_visible
    page.current_user_name.should == @current_user_name 
  end
end

То %{на главной странице отображена ссылка на личный кабинет} do 
  on MainPage do |page|
    page.personal_cabinet_element.when_visible
  end
end
