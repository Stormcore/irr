# encoding: utf-8

Когда /^у интернет\-партнера нет объявлений$/ do
  # Ищем все объявления партнера
  steps %Q{
    * я захожу на stargate
    * на БО я перехожу в категорию "Объявления -> Найти объявления"
  }
  credentials = get_login_and_password_for_role("Интернет-партнер")
  on StargateAdSearchPage do |page|
    page.search_for_user_ads(credentials['email'])
  end
  # Удаляем все объявления
  on StargateAdSearchResultsPage do |page|
    page.get_results do |result|
      unless page.is_deleted?(result)
        page.open_menu(result)
        page.menu_remove
      end
    end
  end
end

Допустим /^я делаю поиск по созданному объявлению$/ do
  on StargateAdSearchPage do |page|
    page.search_for_ad_by_id(@ad_id)
  end
  on StargateAdSearchResultsPage do |page|
    page.get_results.size.should eq(1), "Созданное объявление не найдено"
  end
end

Допустим /^модератор принимает объявление$/ do
  on StargateAdSearchResultsPage do |page|
    result = page.get_results.first
    page.open_menu(result)
    page.menu_approve
    # Страница перезагружается
    result = page.get_results.first
    page.is_approved?(result).should eq(true), 
        "Ошибка при активации объявления"
  end
end

Допустим /^модератор отклоняет объявление с причиной "(.*?)" и текстом$/ do |reason, string|
  on StargateAdSearchResultsPage do |page|
    result = page.get_results.first
    page.open_menu(result)
    page.menu_decline
    # Страница перезагружается
    result = page.get_results.first
    page.is_declined?(result).should eq(true), 
        "Ошибка при отклонении объявления"
  end

  on StargateAdModerationDeclineDialog do |page|
    page.specify_reason(reason)
    page.set_text(string)
    page.confirm
  end
end

То /^интернет\-партнер получает письмо о том, что объявление было принято$/ do
  pending # express the regexp above with the code you wish you had
end

То /^интернет\-партнер получает письмо о том, что объявление было отклонено$/ do
  pending # express the regexp above with the code you wish you had
end

Допустим /^в письме об отклонении модерации указано жирным текстом "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
