# encoding: utf-8

Допустим %{открыта страница realty для региона "$region"} do |region|
  visit RealtyIrrRuMainPage
  on RealtyIrrRuMainPage do |page|
    page.select_region(region)
  end
end

То %{на странице недвижимости в секции "Выберите раздел" показаны ссылки на разделы:} do |sections|
  # table is a Cucumber::Ast::Table
  on RealtyIrrRuSectionsPage do |page|
    sections.hashes.each do |section|
      page.has_section(section['имя раздела']).should == true
    end
  end
end

То %{на странице недвижимости в секции "Тема недели" показана картинка новости} do
  on RealtyIrrRuWeekTopicPage do |page|
    page.topic_picture?.should == true
  end
end

Допустим %{на странице недвижимости в секции "Тема недели" показан заголовок новости} do
  on RealtyIrrRuWeekTopicPage do |page|
    page.topic_title?.should == true
  end
end

Допустим %{на странице недвижимости в секции "Тема недели" показан текст новости} do
  on RealtyIrrRuWeekTopicPage do |page|
    page.topic_text?.should == true
  end
end

То %{на странице недвижимости в секции "Интервью с экспертами" показано фото эксперта} do
  on RealtyIrrRuExpertInterviewPage do |page|
    page.interview_picture?.should == true
  end
end

Допустим %{на странице недвижимости в секции "Интервью с экспертами" показан заголовок интервью} do
  on RealtyIrrRuExpertInterviewPage do |page|
    page.interview_title?.should == true
  end
end

Допустим %{на странице недвижимости в секции "Интервью с экспертами" показан текст интервью} do
  on RealtyIrrRuExpertInterviewPage do |page|
    page.interview_text?.should == true
  end
end

То %{на странице недвижимости в секции "Новости" показаны новости} do
  on RealtyIrrRuNewsPage do |page|
    page.get_news_items.size.should > 0
  end
end

Допустим %{для каждой новости на странице недвижимости показана ссылка с заголовком} do
  on RealtyIrrRuNewsPage do |page|
    page.get_news_items.each do |news_item|
      puts "Проверяем новость '#{news_item.text}'"
      page.news_item_has_link(news_item).should == true
    end
  end
end

Допустим %{на странице недвижимости в секции "Новости" показана ссылка на список всех новостей} do
  on RealtyIrrRuNewsPage do |page|
    page.all_news?.should == true
  end
end

То %{на странице недвижимости в секции "Статьи" показаны статьи} do
  on RealtyIrrRuStoriesPage do |page|
    page.get_stories_items.size.should > 0
  end
end

Допустим %{для каждой статьи на странице недвижимости показана ссылка с заголовком} do
  on RealtyIrrRuStoriesPage do |page|
    page.get_stories_items.each do |story|
      page.story_item_has_link(story).should == true
    end
  end
end

Допустим %{для каждой статьи на странице недвижимости показана фотография} do
  on RealtyIrrRuStoriesPage do |page|
    page.get_stories_items.each do |story|
      page.story_item_has_picture(story).should == true
    end
  end
end

Допустим %{для каждой статьи на странице недвижимости показан текст статьи} do
  on RealtyIrrRuStoriesPage do |page|
    page.get_stories_items.each do |story|
      page.story_item_has_text(story).should == true
    end
  end
end

Допустим %{на странице недвижимости в секции "Статьи" показана ссылка на все статьи} do
  on RealtyIrrRuStoriesPage do |page|
    page.all_stories?.should == true
  end
end

То %{на странице недвижимости в секции "Календарь событий" показан календарь} do
  on RealtyIrrRuCalendarPage do |page|
    page.calendar_container_element.when_present
  end
end

Допустим %{в календаре на странице недвижимости выбран текущий день} do
  time = Time.new
  on RealtyIrrRuCalendarPage do |page|
    page.get_selected_year.to_i.should == time.year
    page.get_selected_month.to_i.should == time.month
    page.get_selected_day.to_i.should == time.day
  end
end

То %{на странице недвижимости в секции "Районы Москвы" показана карта Москвы} do
  on RealtyIrrRuMoscowPage do |page|
    page.map_displayed?.should == true
  end
end

То %{на странице недвижимости в секции "Ипотечные программы банков" показан список ипотечных программ} do
  on RealtyIrrRuIpotekaPage do |page|
    page.get_bank_size.should > 0
  end
end

Допустим %{для каждой ипотечной программы на странице недвижимости указано название банка} do
  on RealtyIrrRuIpotekaPage do |page|
    page.ipoteka_element.each do |row|
      page.get_bank_name(row).should_not be nil?
    end
  end
end

Допустим %{для каждой ипотечной программы на странице недвижимости указаны валюта и процентная ставка} do
  on RealtyIrrRuIpotekaPage do |page|
    page.ipoteka_element.each do |row|
      page.get_percents(row).should_not be nil?
    end
  end
end

Допустим %{на странице недвижимости в секции "Ипотечные программы банков" показана ссылка на все ипотечные программы} do
  on RealtyIrrRuIpotekaPage do |page|
    page.all_banks?.should == true
  end
end
