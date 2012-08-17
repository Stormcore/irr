# encoding: utf-8
Когда %{я перехожу к подаче объявления} do
  #on MainPage do |page|
  #  page.add_advert_element.when_present.click
  #end

  #on AddAdvertMenuPage do |page|
  #  page.addOnlineAdvert_element.when_present.click
  #end

  visit AddAdvertMenuPage
end

Когда %{загружены параметры объявления для категории "$long_category"} do |long_category|
  select_class_for_category(long_category)
end

Когда %{я подаю объявление в категорию "$long_category"} do |long_category|
  on AddAdvertStep1 do |page|
    # Открываем нужную категорию
    long_category.split(' -> ').each_with_index do |category, index|
      page.span_element(class: "ik_select_link_text", text: "Выберите категорию").when_present.click
      page.span_element(class: "ik_select_option", text: category).when_present.click
    end
    # Ждём пока появятся кастомфилды
    page.wait_for_custom_fields_to_appear
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
    page.ensure_additional_parameters_are_displayed
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

То %{на шаге 2 выводится сообщение об отсутствии пакета} do
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
