# encoding: utf-8

class CategoryJobsEducationVacanciesWholesalePage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/wholesale"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Оптовая торговля"

  irr_multi_select "Сфера деятельности", "job_rubric"
  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

