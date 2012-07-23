# encoding: utf-8

class CategoryAnimalsPlantsAnimalsCatsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/animals-plants/animals/cats"
  @category = "Животные и растения -> Животные -> Кошки"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Порода", "breed"
  irr_range_select "Возраст", "age"
  div :age_select, xpath: "//div[@data-item-name='age']"

  def set_parameter(hash)
    if hash['parameter'] == 'Лет/мес.'
      self.age_select_element.when_present.visible?
      self.age_select_element.div_element(class: "controlSelectS").when_present(10).click
      self.age_select_element.element.div(text: hash['value'].strip).when_present(10).click
    else
      super(hash)
    end
  end

end
