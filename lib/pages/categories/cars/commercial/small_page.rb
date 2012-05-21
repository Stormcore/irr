# encoding: utf-8

class CategoryCarsCommercialSmallPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/commercial/small"
  @category = "Авто и мото -> Коммерческий транспорт -> Малый коммерческий транспорт"

  irr_multi_select "Новый или подержанный", "used-or-new"
  irr_range_select "Год выпуска", "car-year"
  irr_multi_select "Тип трансмиссии", "transmittion"
  irr_multi_select "Тип кузова", "bodytype"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_multi_select "Источник", "sourcefrom"
  irr_range_select "Пробег", "mileage"

  def get_parameter (field)
    case field
    when "Пробег"
      result = self.send(self.class.instance_variable_get(:@getter_functions)[field])
      return result.gsub(/ км/, '').to_i / 1000
    else 
      super(field)
    end
  end
end
