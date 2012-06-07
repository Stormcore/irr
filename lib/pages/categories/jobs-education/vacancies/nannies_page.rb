# encoding: utf-8

class CategoryJobsEducationVacanciesNanniesPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/nannies"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Няни, воспитатели, помощники в хозяйстве"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

