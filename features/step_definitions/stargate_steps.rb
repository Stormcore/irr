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
    
  end
end
