# language:ru
# encoding: utf-8
@smoketest
Функционал: Блок Интересные объявления

  Сценарий: Проверка отображения блока для Астаны
      Когда открыта страница для региона "Астана"
          * в блоке "Интересные объявления" показаны объявления
         То в блоке "Интересные объявления" показано <= 10 объявлений
          * в блоке "Интересные объявления" показано > 0 объявлений
          * для каждого объявления в блоке "Интересные объявления" показана фотография
          * для каждого объявления в блоке "Интересные объявления" показана цена
          * в деталях каждого объявления в блоке "Интересные объявления" "Регион" равно "Акмолинская, Астана"
          * каждое объявление в блоке "Интересные объявления" является премиумом

  Сценарий: Проверка отображения блока для Казахстана
      Когда открыта страница для региона "Казахстан"
          * в блоке "Интересные объявления" показаны объявления
         То в блоке "Интересные объявления" показано <= 10 объявлений
          * в блоке "Интересные объявления" показано > 0 объявлений
          * для каждого объявления в блоке "Интересные объявления" показана фотография
          * для каждого объявления в блоке "Интересные объявления" показана цена
          * каждое объявление в блоке "Интересные объявления" является премиумом

  Сценарий: Проверка отображения блока для Авто
      Когда открыта страница для региона "Астана"
          * на главной странице я перехожу в категорию "Авто и мото"
          * я делаю поиск по следующим параметрам:
            | parameter      | min  | max    | value |
         То в блоке "Интересные объявления" показаны объявления
          * в блоке "Интересные объявления" показано <= 10 объявлений
          * в блоке "Интересные объявления" показано > 0 объявлений
          * для каждого объявления в блоке "Интересные объявления" показана фотография
          * для каждого объявления в блоке "Интересные объявления" показана цена
          * в деталях каждого объявления в блоке "Интересные объявления" "Регион" равно "Акмолинская, Астана"
          * каждое объявление в блоке "Интересные объявления" является премиумом

  Сценарий: Проверка отображения блока для недвижки
      Когда открыта страница для региона "Астана"
          * на главной странице я перехожу в категорию "Недвижимость"
         То в блоке "Интересные объявления" показаны объявления
          * в блоке "Интересные объявления" показано <= 10 объявлений
          * в блоке "Интересные объявления" показано > 0 объявлений
          * для каждого объявления в блоке "Интересные объявления" показана фотография
          * для каждого объявления в блоке "Интересные объявления" показана цена
          * в деталях каждого объявления в блоке "Интересные объявления" "Регион" равно "Акмолинская, Астана"
          * каждое объявление в блоке "Интересные объявления" является премиумом