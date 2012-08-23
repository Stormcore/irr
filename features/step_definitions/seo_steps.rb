# encoding: utf-8

Допустим %{на странице категории присутствует секция "$section"} do |section|
  on AdDetailsPage do |page|
    if section == "Быстрый поиск"
      page.has_seo_link_section?.should eq(true), 
        "Отсутствует секция 'Быстрый поиск'"
    else
      page.has_tag_cloud_with_name?(section).should eq(true), 
        "Отсутствует секция '#{section}'"
    end
  end
end

Когда %{я выбираю ссылку "$seo_link" в секции "Быстрый поиск"} do |link_text|
  on @category_page do |page|
    page.select_link_with_text_from_quick_search_section(link_text)
  end
end

Когда %{я выбираю ссылку "$seo_link" в секции "Быстрый поиск" если есть результаты поиска} do |link_text|
  on @category_page do |page|
    puts "Запрос вернул #{@results.length} результатов"
    unless @results.length > 0
      raise "Результаты поиска пустые - не проверяем этот seo-линк"
    else
      page.select_link_with_text_from_quick_search_section(link_text)
    end
  end
end

Когда %{я перехожу по ссылке "$url"} do |url|
  puts "DEBUG: Переходим на <a href='#{url}>#{url}</a>"
  @browser.goto(url)
end

То %{открыта не страница 404} do
  @browser.url.should_not include("404"), "Ошибка 404 при переходе по сео-линку"
end

То %{ссылка содержит "$part"} do |part|
  steps %Q{* открыта не страница 404}
  @browser.url.should include part
end

То %{в поле "$field" выбраны следующие значения:} do |field, table|
  on @category_page do |page|
    results = page.get_selected_parameter(field, nil)
    results.sort.should == table.hashes.map{|h| h['value']}.sort
  end
end

То %{поле "$field" отмечено} do |field|
  on @category_page do |page|
    page.get_selected_parameter(field).should eq(true)
  end
end

То %{в поле "$field" выбрано значение "$expected"} do |field, expected|
  on @category_page do |page|
    result = page.get_selected_parameter(field)
    result[0].should eq(expected)
    result.size.should eq(1), "Выбраны другие значения: '#{result}'"
  end
end

То %{значение в поле "$field" равно "$expected"} do |field, expected|
  on @category_page do |page|
    page.get_selected_parameter(field).strip.should == expected
  end
end

Допустим %{значение в поле "$field" равно от $min} do |field, min|
  on @category_page do |page|
    page.get_selected_parameter(field)['min'].should == min
  end
end

Допустим %{значение в поле "$field" равно до $max} do |field, max|
  on @category_page do |page|
    page.get_selected_parameter(field)['max'].should == max
  end
end

Допустим %{значение в поле "$field" равно в границах "$min - $max"} do |field, min, max|
  steps %Q{* значение в поле "#{field}" равно от #{min}}
  steps %Q{* значение в поле "#{field}" равно до #{max}}
end
