# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsInvertorsPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/auto-technics/invertors"
  @category = "Электроника и техника -> Техника для авто -> Инверторы"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_range_select "Выходное напряжение", "vihodnoe_napryajenije"
  irr_range_select "Выходная мощность", "vihodnaya_moshnost"
  irr_range_select "Пиковая мощность", "cf_labelpikovaya_moshnost"
  irr_range_select "КПД", "kpd"
  irr_checkbox     "Защита от перегрузки", "zashita_ot_peregruzki"
  irr_checkbox     "USB-порт", "usb_port"
end
