# encoding: utf-8

class CategoryElectronicsTechnicsAutoTechnicsRearviewCamerasPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/auto-technics/rearview-cameras"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_single_select "Разрешение экрана", "razrechenije_ecrana"
  irr_range_select  "Угол обзора по вертикали", "ugol_obzora_po_vertikali"
  irr_range_select  "Угол обзора по горизонтали", "ugol_obzora_po_gorizontali"
  irr_range_select  "Минимальное освещение", "minimalnoe_osveshenije"
end
