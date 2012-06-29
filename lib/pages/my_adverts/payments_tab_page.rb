# encoding: utf-8

class MyAdvertsPaymentsTabPage
  include PageObject

  def get_payments_number
    begin
      return self.table_element(:class => "tableLKpayments").when_present.rows
    rescue Watir::Wait::TimeoutError => e
      # Таблица не найдена. Ищем текст "Нет платежей по вашей учетной записи"
      self.div_element(class: "clear-items-block").when_present
      return 0
    end
  end
end

