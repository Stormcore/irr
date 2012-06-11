# encoding: utf-8

class CategoryAnimalsPlantsAnimalsBirdsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/animals-plants/animals/birds"
  @category = "Животные и растения -> Животные -> Птицы"

  irr_multi_select "Тип предложения", "offertype"
  irr_range_select "Возраст", "age"
  irr_single_select "Лет/мес.", "age"

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
