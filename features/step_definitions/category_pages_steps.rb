# encoding: utf-8

Когда %{на главной странице я перехожу в категорию "$long_category"} do |long_category|
  # Open category via menu
  long_category.split(' -> ').each_with_index do |category, index|
    if index == 0
      on MainPage do |page|
        page.select_top_category category
      end
    else
      on GenericCategoryPage do |page|
        page.select_sub_category category
      end
    end
  end
  
  # Set category page variable
  case long_category
  when "Авто и мото -> Выкуп автомобилей. Спрос"
    @category_page = CarsRepaymentSearchPage 

  when "Авто и мото -> Мототехника и Автодома -> Мотоциклы и мопеды"
    @category_page = MotoPage 
  end
end

Когда %{я делаю поиск по следующим параметрам:} do |page_params|
  on @category_page do |page|
    page.expand_all_parameters
    page_params.hashes.each do |hash|
      page.set_parameter(hash)
    end
    page.run_search
  end
end