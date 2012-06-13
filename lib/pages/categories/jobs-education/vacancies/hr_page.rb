# encoding: utf-8

class CategoryJobsEducationVacanciesHRPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/hr"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Управление персоналом"

  irr_multi_select "Сфера работы", "job_rubric", "Сфера деятельности"
  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

