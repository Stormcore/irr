# encoding: utf-8

class CategoryJobsEducationVacanciesCommunalPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/communal"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Бытовые и коммунальные услуги, муниципалитет"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

