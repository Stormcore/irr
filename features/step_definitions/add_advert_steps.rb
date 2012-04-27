# encoding: utf-8
Когда %{я подаю объявление в категорию "$category"} do |long_category|
  on MainPage do |page| 
    page.add_advert_element.when_present.click
  end
  
  on AddAdvertMenuPage do |page| 
    page.addOnlineAdvert_element.when_present.click
  end

  on AddAdvertStep1 do |page| 
    # сохраняем категории для дальнейшей проверки
    @saved_category = long_category
    long_category.split(' -> ').each_with_index do |category, index|
      page.wait_for_category_to_appear(index + 1)
      page.select_item_from_category(index + 1, category)
    end
    page.next_step
  end
  
  last_category = long_category.split(' -> ')[-1]
  steps %Q{Then показан шаг 2 подачи объявлений для категории "#{last_category}"}
end

Когда %{показан шаг 2 подачи объявлений для категории "$category"} do |category|
  case category
  when 'Выкуп автомобилей. спрос'
    @step2page = AddAdvertStep2CarsRepayment
  when 'Мотоциклы и мопеды'
    @step2page = AddAdvertStep2AddMoto
  end
end

Когда %{я ввожу следующие данные на шаге 2:} do |values_hash|
  @advert_data = Hash.new
  on @step2page do |page|
    values_hash.hashes.each do |hash|
      page.set_value(hash['name'], hash['value'])
      # сохраняем значения в объявлении
      @advert_data.add(hash)
    end
  end
end

Когда %{на шаге 2 нажимаю "Далее"} do
  # пауза для ввода капчи
  sleep 10
  on @step2page do |page|
    page.next_step
  end
  # FIXME пауза для загрузки страницы
  sleep 5
end
