# encoding: utf-8

class MyAdvertsPaymentsTabPage
  include PageObject

  def get_payments_number
    if self.table_element(class: "tableLKpayments").exists?
      return self.table_element(class: "tableLKpayments").rows
    else
      unless self.div_element(class: "clear-items-block").exists?
        raise "Нет ни таблицы, ни сообщения об отсутсвии платежей"
      end
      return 0
    end
  end
end

