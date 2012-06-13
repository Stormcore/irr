# encoding: utf-8

class CategoryJobsEducationVacanciesEntertainmentPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/entertainment"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Индустрия отдыха и развлечений"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

