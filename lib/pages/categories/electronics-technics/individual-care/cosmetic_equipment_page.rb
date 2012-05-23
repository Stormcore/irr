# encoding: utf-8

class CategoryElectronicsTechnicsIndiviualCareCosmeticEquipmentPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/electronics-technics/individual-care/cosmetic-equipment"
  @category = "Электроника и техника -> Индивидуальный уход -> Косметические приборы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
end
