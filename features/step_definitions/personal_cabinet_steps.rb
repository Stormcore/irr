# encoding: utf-8

Когда %{я перехожу в личный кабинет} do
  on MainPage do |page|
    page.open_presonal_cabinet
  end
end

То /^открыт личный кабинет пользователя$/ do
  on PersonalCabinetPage do |page|
    page.is_displayed?
  end
end

Допустим /^в списке объявлений присутствует объявление с заголовком "(.*?)"$/ do |title|
  on PersonalCabinetPage do |page|
    page.has_ad_with_title?(title).should eq(true)
    @ad_id = page.get_ad_id_for_title(title)
  end
end

Допустим /^у выбранного объявления указана цена "(.*?)"$/ do |price|
  on PersonalCabinetPage do |page|
    page.get_price(@ad_id).should eq(price)
  end
end

Допустим /^у выбранного объявления указан регион "(.*?)"$/ do |region|
  on PersonalCabinetPage do |page|
    page.get_region(@ad_id).should eq(region)
  end
end

Допустим /^у выбранного объявления статус "(.*?)"$/ do |status|
  on PersonalCabinetPage do |page|
    page.get_status(@ad_id).should eq(status)
  end
end

Допустим /^у выбранного объявления показана фотография$/ do
  on PersonalCabinetPage do |page|
    page.has_photo(@ad_id).should eq(true)
  end
end

Допустим /^я редактирую выбранное объявление$/ do
  on PersonalCabinetPage do |page|
    page.do_edit(@ad_id)
  end
end

Когда /^я открываю детали выбранного объявления$/ do
  on PersonalCabinetPage do |page|
    page.open_details @ad_id
  end
end
