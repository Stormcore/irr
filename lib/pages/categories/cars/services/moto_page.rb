# encoding: utf-8

class CategoryCarsServicesMotoPage < AdDetailsPage
  include PageObject

  div :offertype, :xpath => "//div[@data-item-name='offertype']"

  def set_parameter (hash)
    case hash['parameter']

    when "Тип предложения"
      singleselect(self.offertype_element, hash['value'])

    else
      super(hash)
    end
  end
  
  def get_parameter (field)
    get_generic_parameter(field) 
  end
end