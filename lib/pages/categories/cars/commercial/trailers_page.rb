# encoding: utf-8

class CategoryCarsCommercialTrailersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/commercial/trailers"
  @category = "Авто и мото -> Коммерческий транспорт -> Грузовые прицепы"

  irr_multi_select "Новый или подержанный", "used-or-new"
  irr_range_select "Год выпуска", "car-year"
  irr_multi_select "Тип прицепа", "trailertype"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_text_field   "Число осей", "shafts"
  irr_range_select "Пробег", "mileage"
  irr_multi_select "Источник", "sourcefrom"

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
