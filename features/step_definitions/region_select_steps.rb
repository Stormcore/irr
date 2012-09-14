# encoding: utf-8
Допустим %{я открываю окно выбора региона} do
  on RegionSelectPage do |page|
    page.open_dialog
  end
end

Допустим /^в окне выбора региона в секции (\d+) я выбираю "(.*)"$/ do |level, region|
  on RegionSelectPage do |page|
    page.select_link_from_level(level.to_i, region)
  end
end

Допустим /^в окне выбора региона секция (\d+) (не |)показана$/ do |level, state|
  on RegionSelectPage do |page|
    page.is_level_visible(level.to_i).should eq(state!="не ")
  end
end

Допустим /^в окне выбора региона в секции (\d+) показаны следующие регионы:$/ do |level, table|
  actual = []
  on RegionSelectPage do |page|
    actual = page.get_all_links_in_level(level.to_i)
    expected = table.raw.flatten
    (actual - expected).size == 0
  end
end

Допустим %{в окне выбора региона нажать OK} do
  on RegionSelectPage do |page|
    page.ok
  end
end

Допустим %{в окне выбора региона выбрано "$region"} do |region|
  on RegionSelectPage do |page|
    page.selected_region.should == region
  end
end

def construct_region_url(url, region)
  case region
  when "Москва"
    url = url+'/moskva-gorod/'
  when "Россия"
    url = url.gsub("http://", "http://russia.")
  when "Бийск"
    url = url.gsub("http://", "http://biysk.")
  when "Москва и область", "Казахстан"
    url
  when "Усть-Алтан"
    url = url.gsub("http://", "http://ust-orda.")+'/osinskiy-r_n/ust-altan-selo/'
  when "Пушкино"
    url = url+'/pushkinskiy-r_n/pushkino-gorod/'
  when "Астана"
    url = url.gsub("http://", "http://astana.")
  when "Актобе"
    url = url.gsub("http://", "http://akt-obl.")+'/aktobe-gorod/'
  end
  # Вырезаем лишние двойные слэши (но не в http://)
  url = "http://"+url.gsub("http://","").gsub("//","/")
end

Допустим /^открыта страница для (города|региона) "(.*)"$/ do |other, region|
  @region = region
  @browser.goto(construct_region_url(BASE_URL,region))
end

Допустим %{открыта страница для (города|региона) "$region" (без проверок)} do |other, region|
  steps %Q{
    Given открыта главная страница
      And я выбираю страну "Популярные города"
      And я выбираю регион "#{region}"
  }
end
