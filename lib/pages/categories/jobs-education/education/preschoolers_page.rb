# encoding: utf-8

class CategoryJobsEducationEducationPreschoolersPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/education/preschoolers"
  @category = "Работа и образование -> Образование -> Дошкольное образование"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Занятия", "pre_school_subject_type"
  irr_range_select "Стаж репетиторской деятельности", "practice_period"
  irr_checkbox     "Выезд", "visit"
end
