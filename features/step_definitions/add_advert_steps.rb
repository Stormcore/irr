# encoding: utf-8
Когда %{я перехожу к подаче объявления} do
  on MainPage do |page|
    page.add_advert_element.when_present.click
  end

  on AddAdvertMenuPage do |page|
    page.addOnlineAdvert_element.when_present.click
  end
end

Когда %{загружены параметры объявления для категории "$long_category"} do |long_category|
  select_class_for_category(long_category)
end

Когда %{я подаю объявление в категорию "$long_category"} do |long_category|
  #steps %Q{* загружены параметры объявления для категории "#{long_category}"}
  on AddAdvertStep1 do |page|
    # сохраняем категории для дальнейшей проверки
    long_category.split(' -> ').each_with_index do |category, index|
      page.wait_for_category_to_appear(index + 1)
      page.select_item_from_category(index + 1, category)
    end
    page.next_step
  end
end

Когда %{я перехожу на шаг 3} do
  on AddAdvertStep2 do |page|
    page.next_step
  end
end

Когда %{я подаю объявление в категорию "$category" с параметрами:} do |category, page_params|
  steps %Q{
    * я перехожу к подаче объявления
    * я подаю объявление в категорию "#{category}"
  }
  on AddAdvertStep2 do |page|
    page_params.hashes.each do |hash|
      page.set_parameter(hash)
    end
  end
end

Когда %{я ввожу следующие данные на шаге 2:} do |page_params|
  on AddAdvertStep2 do |page|
    page_params.hashes.each do |hash|
      page.set_parameter(hash)
    end
  end
end

Допустим /^я ввожу следующие данные на шаге 2 в секции "(.*?)":$/ do |section, page_params|
  on AddAdvertStep2 do |page|
    page.ensure_section_is_visible(section)
    page_params.hashes.each do |hash|
      page.set_parameter(hash)
    end
  end
end


Когда %{я сохраняю редактируемое объявление} do
  on AddAdvertStep2 do |page|
    page.save
  end
end

Когда %{я загружаю фото на шаге 2} do
  on AddAdvertStep2 do |page|
    page.load_photo
  end
end

Когда %{я загружаю видео на шаге 2} do
  on AddAdvertStep2 do |page|
    page.load_video
  end
end

То /^на шаге (\d+) выводится сообщение об отсутствии пакета$/ do |arg1|
  on AddAdvertStep2 do |page|
    page.has_package_message.should eq(false),
      "Сообщение об отсутствии пакета не показано"

    expected_message =<<PACKAGE_MESSAGE
    У Вас нет пакета для выполнения данного действия. Приобретите соответствующий пакет или зарегистрируйтесь как обычный пользователь, после чего Вам будет доступно данное действие.
PACKAGE_MESSAGE

    page.get_package_message.strip.should eq(expected_message.strip),
      "Неправильное сообщение об отсутствии пакета"
  end
end
