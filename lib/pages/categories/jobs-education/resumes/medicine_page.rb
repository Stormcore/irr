# encoding: utf-8

class CategoryJobsEducationresumesMedicinePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/resumes/medicine"
  @category = "Работа и образование -> Резюме: поиск работы -> Медицина и фармацевтика"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
  irr_single_select "Пол", "job_sex"
  irr_range_select "Возраст", "age"
  irr_single_select "Образование", "job_education"
  irr_single_select "Иностранные языки", "language_type"
  irr_multi_select "Водительские права", "driving_license"
  irr_checkbox     "Личный автомобиль", "car"
end
