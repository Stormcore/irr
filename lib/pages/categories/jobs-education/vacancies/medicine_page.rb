# encoding: utf-8

class CategoryJobsEducationVacanciesMedicinePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/medicine"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Медицина и фармацевтика"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

