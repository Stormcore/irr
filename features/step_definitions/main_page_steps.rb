# encoding: utf-8
Допустим %{на главной странице показан регион "$region"} do |region|
  on MainPage do |page| page.selected_region_element.text.should == region end
end

Если %{я указываю искать только в заголовках объявления} do
  on MainPage do |page| page.only_title_element.when_present.check end
end

Если %{я ищу "$keywords"} do |keywords|
  @keywords = keywords
  on MainPage do |page|
    page.search_for(keywords)
  end
end

Когда %{я перехожу в список моих объявлений} do
  on MainPage do |page|
    page.open_my_adverts
  end
end

Допустим /^на главной странице (не|) показана секция "Вы недавно смотрели"$/ do |clause|
  on MainPage do |page|
    if clause == "не"
      page.has_recently_viewed_section.should eq(false), 
         "Секция 'Вы недавно смотрели' присутствует"
    else
      page.has_recently_viewed_section.should eq(true), 
         "Секция 'Вы недавно смотрели' отсутствует"
    end
  end
end

Допустим %{в секции "Вы недавно смотрели" показано $operator $number объявлений} do |operator, number|
  on MainPage do |page|
    eval("page.get_recently_viewed_number.should #{operator} #{number}")
  end
end

Допустим /^у первого объявления в секции "Вы недавно смотрели" отображен(о|а|) правильн(ое|ый|ая) (.*)$/ do |other1, other2, parameter|
  on MainPage do |page|
    case parameter
    when "фото"
      page.get_recently_viewed_detail(0, "photo").should eq(@result_details["photo"])
    when "заголовок"
      # тайтл обрезается до 35 символов + троеточие
      original_title = page.get_recently_viewed_detail(0, "title")
      if original_title.length > 35
        shortened_title = original_title[0..35] + "..."
      else
        page.get_recently_viewed_detail(0, "title").should eq(original_title)
      end
    when "цена"
      page.get_recently_viewed_detail(0, "price").should eq(@result_details["price"])
    when "валюта"
      page.get_recently_viewed_detail(0, "currency").should eq(@result_details["currency"])
    when "URL"
      page.get_recently_viewed_detail(0, "URL").should eq(@result_details["url"])
    end
  end
end
