# encoding: utf-8

class CategoryJobsEducationEducationTutorsPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/education/tutors"
  @category = "Работа и образование -> Образование -> Преподаватели, репетиторы"

  irr_multi_select "Тип предложения", "offertype"
  irr_single_select "Предмет", "tutor_subject_type"
  irr_single_select "Возрастные группы", "tutor_for"
  irr_range_select "Стаж репетиторской деятельности", "practice_period"
  irr_checkbox     "Выезд", "visit"
end
