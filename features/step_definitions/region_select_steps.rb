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

Допустим %{открыта страница для города "$region"} do |region|
  if region == "Москва"
    @browser.goto BASE_URL+'/moskva-gorod/'
  else
    steps %Q{
      Given открыта главная страница
        And я выбираю страну "Популярные города"
        And я выбираю регион "#{region}"
        And в окне выбора региона в статусбаре показан "#{region}"
        And в окне выбора региона нажать OK
        And на главной странице показан регион "#{region}"
    }
  end
end

Допустим %{открыта страница для города "$region" (без проверок)} do |region|
  steps %Q{
    Given открыта главная страница
      And я выбираю страну "Популярные города"
      And я выбираю регион "#{region}"
      And в окне выбора региона нажать OK
  }
end
