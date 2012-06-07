# encoding: utf-8

class CategoryJobsEducationresumesSecurityPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/resumes/security"
  @category = "Работа и образование -> Резюме: поиск работы -> Охрана, безопасность"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
  irr_single_select "Пол", "work_sex"
  irr_range_select "Возраст", "age"
  irr_single_select "Образование", "education"
  irr_single_select "Иностранные языки", "language_type"
  irr_multi_select "Водительские права", "driving_license"
  irr_checkbox     "Личный автомобиль", "car"
end
