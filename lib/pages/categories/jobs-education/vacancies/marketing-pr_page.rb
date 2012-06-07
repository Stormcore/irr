# encoding: utf-8

class CategoryJobsEducationVacanciesMarketingPRPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/marketing-pr"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Маркетинг, Реклама, PR"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

