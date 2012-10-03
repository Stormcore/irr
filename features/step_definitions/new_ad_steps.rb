# encoding: utf-8

То /^открыта страница выбора региона и категории$/ do
  on NewAdPage do |page|
    page.is_displayed?.should eq(true)
  end
end

Когда /^на странице выбора региона и категории я ввожу следующие данные:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
    case hash['поле']
    when "Регион"
      # TODO: Проверить текущее значение региона
      on NewAdPage do |page|
        page.open_region_selector
      end
      on RegionSelectPage do |page|
        page.select_region hash['значение']
      end

    when "Раздел"
      on NewAdPage do |page|
        page.set_section hash['значение']
      end

    else
      raise "Не найден параметр #{hash['поле']}"
    end
  end
end

Допустим /^я перехожу ко вводу деталей объявления$/ do
  on NewAdPage do |page|
    page.continue
  end
end

Допустим /^в секции "(.*?)" я ввожу следующие параметры:$/ do |section, table|
  on NewAdPage do |page|
    table.hashes.each do |hash|
      page.set_value section, hash['поле'], hash['значение']
    end
  end
end

Допустим /^я загружаю фото при подаче объявления$/ do
  on NewAdPage do |page|
    page.upload_foto
  end
end

Допустим /^я размещаю объявление$/ do
  on NewAdPage do |page|
    page.submit_ad
  end
end

Допустим /^при подаче не показано сообщений об ошибке$/ do
  on NewAdPage do |page|
    page.has_errors?.should == false
  end
end
