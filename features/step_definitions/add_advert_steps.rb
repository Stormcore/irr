# encoding: utf-8
Когда %{я перехожу к подаче объявления} do
  on MainPage do |page|
    page.add_advert_element.when_present.click
  end

  on AddAdvertMenuPage do |page|
    page.addOnlineAdvert_element.when_present.click
  end
end

Когда %{я перехожу к подаче объявления используя новую подачу} do
  new_url = construct_region_url(BASE_URL+"/advertSubmission/step1/", @region)
  @browser.goto(new_url)
end


Когда %{загружены параметры объявления для категории "$long_category"} do |long_category|
  select_class_for_category(long_category)
end

Когда %{я подаю объявление в категорию "$long_category" используя новую подачу} do |long_category|
  on AddAdvertStep1New do |page|
    # Открываем нужную категорию
    long_category.split(' -> ').each_with_index do |category, index|
      page.span_element(class: "ik_select_link_text", text: "Выберите категорию").when_present.click
      page.span_element(class: "ik_select_option", text: category).when_present.click
    end
    # Ждём пока появятся кастомфилды
    page.wait_for_custom_fields_to_appear
  end
end

Когда %{я подаю объявление в категорию "$long_category"} do |long_category|
  new_categories = ['Авто и мото -> Легковые автомобили -> Автомобили с пробегом',
                    'Недвижимость -> Квартиры. аренда']
  @new_advert_can_be_used = new_categories.include?(long_category)
  if @new_advert_can_be_used
    steps %{
      * я перехожу к подаче объявления используя новую подачу
      * я подаю объявление в категорию "#{long_category}" используя новую подачу
    }
  else
    on AddAdvertStep1 do |page|
      # Открываем нужную категорию
      long_category.split(' -> ').each_with_index do |category, index|
        Watir::Wait.until {page.list_item_element(id: "section_#{index + 1}").exists?}
        li = page.list_item_element(id: "section_#{index + 1}").when_present
        li.unordered_list_element.when_present.click
        a = li.link_elements(href: "#").find do |a|
          UnicodeUtils.downcase(a.text) == UnicodeUtils.downcase(category)
        end
        raise "Категория '#{category}' не найдена" if a.nil?
        a.click
       end
      page.next_step
    end
  end
end

Когда %{я перехожу на шаг 3} do
  classs = @new_advert_can_be_used ? AddAdvertStep2New : AddAdvertStep2
  on classs do |page|
    page.next_step
    begin
      Watir::Wait.until { page.next_step_element.exists? == false or
                          page.next_step_element.text == "Далее" }
    rescue
    end
    raise "Ошибка на шаге 3:\n#{page.error_message}" if page.next_step_element.exists?
  end
end

Когда %{я подаю объявление в категорию "$category" с параметрами:} do |category, page_params|
  new_categories = ['Авто и мото -> Легковые автомобили -> Автомобили с пробегом',
                    'Недвижимость -> Квартиры. аренда']
  @new_advert_can_be_used = new_categories.include?(category)
  if @new_advert_can_be_used
    steps %{
      * я перехожу к подаче объявления используя новую подачу
      * я подаю объявление в категорию "#{category}" используя новую подачу
    }
  else
    steps %Q{
      * я перехожу к подаче объявления
      * я подаю объявление в категорию "#{category}"
    }
  end
  classs = @new_advert_can_be_used ? AddAdvertStep2New : AddAdvertStep2
  on classs do |page|
    page_params.hashes.each do |hash|
      page.set_parameter(hash)
    end
  end
end

Когда %{на шаге 2 я ввожу логин и пароль роли "$role"} do |role|
  credentials = get_login_and_password_for_role(role)
  puts "DEBUG: Логин: #{credentials['login']}, пароль '#{credentials['password']}'"
  steps %Q{
    * я ввожу следующие данные на шаге 2:
     | parameter | value                      |
     | email     | #{credentials['login']}    |
     | Пароль    | #{credentials['password']} |
  }
  @current_user_name = credentials['username']
end

Когда %{я ввожу следующие данные на шаге 2:} do |page_params|
  classs = @new_advert_can_be_used ? AddAdvertStep2New : AddAdvertStep2
  on classs do |page|
    page_params.hashes.each do |hash|
      page.set_parameter(hash)
    end
  end
end

Когда %{я ввожу следующие данные на шаге 2 (старая подача):} do |page_params|
  on AddAdvertStep2 do |page|
    page_params.hashes.each do |hash|
      page.set_parameter(hash)
    end
  end
end

Допустим /^я ввожу следующие данные на шаге 2 в секции "(.*?)":$/ do |section, page_params|
  classs = @new_advert_can_be_used ? AddAdvertStep2New : AddAdvertStep2
  on classs do |page|
    page.ensure_additional_parameters_are_displayed if classs == AddAdvertStep2New
    page.ensure_section_is_visible(section)
    page_params.hashes.each do |hash|
      page.set_parameter(hash)
    end
  end
end


Когда %{я сохраняю редактируемое объявление} do
  classs = @new_advert_can_be_used ? AddAdvertStep2New : AddAdvertStep2
  on classs do |page|
    page.save
  end
end

Когда %{я загружаю фото на шаге 2} do
  classs = @new_advert_can_be_used ? AddAdvertStep2New : AddAdvertStep2
  on classs do |page|
    page.load_photo
  end
end

Когда %{я загружаю видео на шаге 2} do
  classs = @new_advert_can_be_used ? AddAdvertStep2New : AddAdvertStep2
  on classs do |page|
    page.load_video
  end
end

То %{на шаге 2 выводится сообщение об отсутствии пакета} do
  classs = @new_advert_can_be_used ? AddAdvertStep2New : AddAdvertStep2
  on classs do |page|
    page.has_package_message.should eq(false),
      "Сообщение об отсутствии пакета не показано"

    expected_message =<<PACKAGE_MESSAGE
    У Вас нет пакета для выполнения данного действия. Приобретите соответствующий пакет или зарегистрируйтесь как обычный пользователь, после чего Вам будет доступно данное действие.
PACKAGE_MESSAGE

    page.get_package_message.strip.should eq(expected_message.strip),
      "Неправильное сообщение об отсутствии пакета"
  end
end
