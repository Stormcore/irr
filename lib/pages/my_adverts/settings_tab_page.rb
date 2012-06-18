# encoding: utf-8

class MyAdvertsSettingsTabPage
  include PageObject

  span :general_header, :text => "Общие настройки учетной записи"
  span :adverts_header, :text => "Настройки объявлений"
  span :import_header,  :text => "Настройки импорта"
  span :notification_header,  :text => "Настройки уведомлений"
  span :packages_header,  :text => "Вы приобрели пакет Интернет-партнера со следующими параметрами"
end
