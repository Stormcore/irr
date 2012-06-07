# encoding: utf-8

class CategoryJobsEducationEducationTrainingsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/education/trainings"
  @category = "Работа и образование -> Образование -> Курсы, семинары, тренинги"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Направление", "trainings_subject_type"
end
