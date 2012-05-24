# encoding: utf-8

class CategoryPhotoPhototechnicsDigitalPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/photo/phototechnics/digital/"
  @category = "Телефоны и связь -> Фото, оптика -> Фототехника -> Фотоаппараты цифровые"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Состояние", "used-or-new"
  irr_multi_select "Марка", "make"
  irr_multi_select "Модель", "model"
  irr_single_select "Тип видоискателя", "photodigit_view"
  irr_range_select "Кол-во мегапикселей матрицы", "photodigit_mpix"

  def get_parameter(field)
  if field == "Кол-во мегапикселей матрицы"
    super(field).gsub(/ Мп/,'')
  else
    super(field)
  end
end
