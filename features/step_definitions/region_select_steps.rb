# encoding: utf-8
Допустим %{открыта главная страница} do
  visit RegionSelectPage
end

Допустим %{я выбираю страну "$country"} do |country|
  on RegionSelectPage do |page| page.select_country(country) end
end

Допустим %{я выбираю регион "$region"} do |region|
  on RegionSelectPage do |page| page.select_region(region) end
end

Допустим %{в окне выбора региона нажать OK} do
  on RegionSelectPage do |page| page.ok end
end

Допустим %{в окне выбора региона в статусбаре показан "$region"} do |region|
  on RegionSelectPage do |page| page.selected_region.should == region end
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
