# encoding: utf-8

class CategoryJobsEducationVacanciesITPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/it"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Информационные технологии и интернет"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

