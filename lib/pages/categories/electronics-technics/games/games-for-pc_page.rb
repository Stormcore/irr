# encoding: utf-8

class CategoryElectronicsTechnicsGamesGamesForPCPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/games/game-for-pc"
  @category = "Электроника и техника -> Игры, игровые приставки -> Игры для PC"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
