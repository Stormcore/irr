# encoding: utf-8

Когда %{у интернет-партнера нет объявлений} do
  steps %Q{
    * открыта страница для региона "Россия"
    * я вхожу под пользователем с ролью "Интернет-партнер"
    * я перехожу в список моих объявлений
    * в ЛК ИП открыт список объявлений пользователя
    * в ЛК ИП я удаляю все объявления
  }
end

Допустим %{я делаю поиск по созданному объявлению} do
  on StargateAdSearchPage do |page|
    page.search_for_ad_by_id(@ad_id)
  end
  on StargateAdSearchResultsPage do |page|
    page.get_results.size.should eq(1), "Созданное объявление не найдено"
  end
end

Допустим %{модератор принимает объявление} do
  on StargateAdSearchResultsPage do |page|
    page.open_menu(page.get_results.first)
    page.menu_approve
    # Страница перезагружается
    page.is_approved?(page.get_results.first).should eq(true), 
        "Ошибка при активации объявления - объявление не отмечено как одобренное"
  end
end

Допустим /^модератор отклоняет объявление с причиной "(.*?)" и текстом$/ do |reason, string|
  on StargateAdSearchResultsPage do |page|
    page.open_menu(page.get_results.first)
    page.menu_decline
    # Страница перезагружается
  end

  on StargateAdModerationDeclineDialog do |page|
    page.specify_reason(reason)
    page.set_text(string)
    page.confirm
  end

  on StargateAdSearchResultsPage do |page|
    page.open_menu(page.get_results.first)
    page.is_declined?(page.get_results.first).should eq(true), 
        "Ошибка при отклонении объявления"
  end
end

То %{интернет-партнер получает письмо о том, что объявление было принято} do
  pending # express the regexp above with the code you wish you had
end

То %{интернет-партнер получает письмо о том, что объявление было отклонено} do
  pending # express the regexp above with the code you wish you had
end

Допустим %{в письме об отклонении модерации указано жирным текстом "(.*?)"} do |bold_text|
  pending # express the regexp above with the code you wish you had
end
