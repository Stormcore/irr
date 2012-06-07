# encoding: utf-8

class CategoryJobsEducationVacanciesBeautyPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/jobs-education/vacancies/beauty"
  @category = "Работа и образование -> Вакансии: поиск сотрудников -> Красота, фитнес, спорт"

  irr_multi_select "Специализация", "job_specialization"
  irr_single_select "Режим работы", "work_period"
  irr_single_select "Тип занятости", "schedule"
end

