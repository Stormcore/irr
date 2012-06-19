# encoding: utf-8

class MyAdvertsPaymentsTabPage
  include PageObject

  def get_payments_number
    self.table_element(:class => "tableLKpayments").when_present.rows
  end
end

