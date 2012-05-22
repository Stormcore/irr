# encoding: utf-8

class CategoryElectronicsTechnicsWashingMachinesWashingPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/washing-machines/washing"
  @category = "Электроника и техника -> Стиральные машины -> Стиральные машины"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Тип загрузки", "washmach_load"
  irr_single_select "Объем загрузки, кг", "washmach_vol"
  irr_checkbox      "Сушка", "washmach_dry"
  irr_checkbox      "Встраиваемая техника", "fridge_builtin"
  
  def get_parameter(field)
    if field == "Объем загрузки, кг"
      # Вырезаем килограммы
      result = super(field).gsub(/ кг/,'')
    else
      super(field)
    end
  end
end
