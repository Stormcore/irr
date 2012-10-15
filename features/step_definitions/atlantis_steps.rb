# encoding: utf-8

Допустим /^открыта главная страница БО$/ do
  @browser.goto(BASE_URL+"/atlantis")
end

Когда /^я ввожу логин "(.*?)" и пароль "(.*?)" на БО$/ do |login, password|
  on AtlantisLoginPage do |page|
    page.login_as login,password
  end
end

То /^открыта страница БО$/ do
  on AtlantisMainPage do |page|
    page.wait_for_page_to_be_opened
  end
end

Когда /^я вхожу на БО используя логин "(.*?)" и пароль "(.*?)"$/ do |login, password|
  steps %Q{
    * открыта главная страница БО
    * я ввожу логин "#{login}" и пароль "#{password}" на БО
    * открыта страница БО
  }
end

Допустим /^на БО я открываю страницу "(.*?)"$/ do |long_category|
  on AtlantisMainPage do |page|
    long_category.split(' - ').each do |category|
      page.open_category category
    end
  end
end

То /^открыта страница списка новостей БО$/ do
  on AtlantisNewsListPage do |page|
    page.wait_for_page_to_be_opened
  end
end

Когда /^на БО я создаю новую новость с параметрами:$/ do |table|
  # table is a Cucumber::Ast::Table
  on AtlantisNewsListPage do |page|
    page.open_news_add_dialog
  end

  on AtlantisNewsAddPage do |page|
    table.hashes.each do |hash|
      page.set_parameter hash
    end
    page.add_photo
    page.save_ad
  end
end

То /^на БО новость "(.*?)" показана в списке новостей$/ do |name|
  on AtlantisNewsListPage do |page|
    page.has_news?(name).should eq(true)
  end
end

Допустим /^открыта страница поиска объявления$/ do
  on AtlantisAdSearchPage do |page|
    page.wait_for_page_to_be_opened
  end
end

Допустим /^я ищу созданное объявление$/ do
  on AtlantisAdSearchPage do |page|
    page.search_by_id @ad_id
  end
end

То /^в списке объявлений на БО показано (\d+) объявление$/ do |number|
  on AtlantisAdSearchPage do |page|
    page.get_all_results_size.to_i.should >= number.to_i
  end
end

Когда /^я принимаю объявление$/ do
  on AtlantisAdSearchPage do |page|
    page.accept_ad 1
  end
end
