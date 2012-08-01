# encoding: utf-8

class CategoryElectronicsTechnicsGamesGamesForConsolesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/games/games-for-consoles"
  @category = "Электроника и техника -> Игры, игровые приставки -> Игры для приставок"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
end
