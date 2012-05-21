# encoding: utf-8

class CategoryCarsServicesEvaluationPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/cars/services/evaluation"
  @category = "Авто и мото -> Автосервис и услуги -> Экспертиза и оценка"
  
  irr_single_select "Тип предложения", "offertype"

end
