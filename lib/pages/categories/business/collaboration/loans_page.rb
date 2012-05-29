# encoding: utf-8

class CategoryBusinessCollaborationLoansPage < AdDetailsPage
  include PageObject

  @@url_suffix = "/business/collaboration/loans"
  @category = "Бизнес и партнерство -> Партнерство и сотрудничество -> Кредиты, займы"

  irr_multi_select "Тип предложения", "offertype"
  irr_multi_select "Кредиты для физ.лиц", "loan_type"
  irr_multi_select "Кредиты для юр.лиц", "loan_type2"
  irr_range_select "Срок кредита, лет", "credit_period"
  irr_range_select "Процент, %", "procent"
  irr_single_select "Обеспечение", "bond"
  irr_checkbox     "С неподтвержденным доходом", "unconfirmed_incom"
  irr_checkbox     "Экспресс-кредит", "express_credit"
end
