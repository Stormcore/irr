# encoding: utf-8

class CategoryElectronicsTechnicsWashingMachinesDryingPage < AdDetailsPage
  include PageObject
 
  @@url_suffix = "/electronics-technics/washing-machines/drying"
  @category = "Электроника и техника -> Стиральные машины -> Сушильные машины"
  
  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_single_select "Объем загрузки", "dryer_vol"
  
  def get_parameter(field)
    if field == "Объем загрузки"
      # Вырезаем килограммы
      result = super(field).gsub(/ кг/,'')
    else
      super(field)
    end
  end
end
