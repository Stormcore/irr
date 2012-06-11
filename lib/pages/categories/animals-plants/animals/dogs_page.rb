# encoding: utf-8

class CategoryAnimalsPlantsAnimalsDogsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/animals-plants/animals/dogs"
  @category = "Животные и растения -> Животные -> Собаки"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Порода", "breed"
  irr_range_select "Возраст", "age"
  irr_single_select "Лет/мес.", "age"
  irr_single_select "Пол", "animal_sex"

  def get_parameter(field)
    case field
    when "Возраст"
      super("Возраст").split[0].to_i
    when "Лет/мес."
      super("Возраст").split[1]
    else
      super(field)
    end
  end
end
