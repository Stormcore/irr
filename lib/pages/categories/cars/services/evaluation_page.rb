# encoding: utf-8

class CategoryCarsServicesEvaluationPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/evaluation"
  
  irr_single_select "Тип предложения", "offertype"

end
