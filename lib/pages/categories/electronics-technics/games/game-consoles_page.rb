# encoding: utf-8

class CategoryElectronicsTechnicsGamesGameConsolesPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/games/game-consoles"
  @category = "Электроника и техника -> Игры, игровые приставки -> Игровые приставки"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип приставки", "gameconsole_type"
end
