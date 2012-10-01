# encoding: utf-8

Когда %{открыта главная страница} do
  @browser.goto(BASE_URL)
end

Когда %{на главной странице я переключаю тип объявлений на "$section"} do |section|
  on MainPage do |page|
    page.switch_to_category section
  end
end

Допустим %{в списке марок показаны следующие марки:} do |table|
  actual = []
  on MainPage do |page|
    actual = page.get_makes_list.combination(1).to_a
  end
  unless actual.sort == table.rows.sort
    actual_table = Cucumber::Ast::Table.new(actual.sort)
    expected_table = Cucumber::Ast::Table.new(table.rows.sort)
    File.open("/tmp/file1", 'w') {|f| 
      f.write(expected_table.to_s(options = {color: false})) }
    File.open("/tmp/file2", 'w') {|f| 
      f.write(actual_table.to_s(options = {color: false})) }

    # Разрываем таблицу
    puts "</table>"
    # Вставляем diff css + цвет черный (cucumber сделает красным)
    puts "<style type='text/css'>#{Diffy::CSS} .diff {color: black}</style>"
    # Выводим diff
    puts Diffy::Diff.new('/tmp/file1', '/tmp/file2', 
                         source:'files', diff: ['-w', '-U 10000']).to_s(:html)
    # Прячем оставшуюся таблицу
     puts "<table style='display:none'><tbody><tr><td>"

    # две пустых строчки комментариев
    # Из-за html кода ломается отображение контекста ошибки
    raise "Ошибка проверки списка марок"
  end
end

Когда /^на главной странице отображены новости$/ do
  on MainPage do |page|
    page.has_news_section?.should be true
  end
end

Допустим /^у каждой новости отображен заголовок$/ do
  on MainPage do |page|
    page.get_news.map{|a| a.has_key?('title')}.should_not include(false)
  end
end

Допустим /^у каждой новости показана картинка$/ do
  on MainPage do |page|
    page.get_news.map{|a| a.has_key?('image')}.should_not include(false)
  end
end

Допустим /^у каждой новости показан первый абзац$/ do
  on MainPage do |page|
    page.get_news.map{|a| a.has_key?('description')}.should_not include(false)
  end
end

Когда /^на главной странице отображены статьи$/ do
  on MainPage do |page|
    page.has_articles_section?.should be true
  end
end

Допустим /^у каждой статьи отображен заголовок$/ do
  on MainPage do |page|
    page.get_articles.map{|a| a.has_key?('title')}.should_not include(false)
  end
end

Допустим /^у каждой статьи показана картинка$/ do
  on MainPage do |page|
    page.get_articles.map{|a| a.has_key?('image')}.should_not include(false)
  end
end

Допустим /^у каждой статьи показан первый абзац$/ do
  on MainPage do |page|
    page.get_articles.map{|a| a.has_key?('description')}.should_not include(false)
  end
end

Когда /^на главной странице отображены события$/ do
  on MainPage do |page|
    page.has_events_section?.should be true
  end
end

Допустим /^в секции событий отображен календарь$/ do
  on MainPage do |page|
    page.has_calendar?.should be true
  end
end

Допустим /^в секции событий отображен список ближайших событий$/ do
  on MainPage do |page|
    page.has_events_list.should be true
  end
end

Когда /^на главное странице отображен список интернет\-партнеров$/ do
  on MainPage do |page|
    page.has_powersellers_section?.should be true
  end
end

Допустим /^в секции интернет\-партнеров у каждого партнера отображен логотип$/ do
  on MainPage do |page|
    page.get_powersellers.map{|a| a.has_key?('image')}.should_not include(false)
  end
end

Допустим /^в секции интернет\-партнеров у каждого партнера отображено название$/ do
  on MainPage do |page|
    page.get_powersellers.map{|a| a.has_key?('title')}.should_not include(false)
  end
end

Допустим /^в секции интернет\-партнеров у каждого партнера отображено описание$/ do
  on MainPage do |page|
    page.get_powersellers.map{|a| a.has_key?('description')}.should_not include(false)
  end
end

Допустим /^в секции интернет\-партнеров у каждого партнера отображено количество объявлений$/ do
  on MainPage do |page|
    page.get_powersellers.map{|a| a.has_key?('ads_count')}.should_not include(false)
  end
end
