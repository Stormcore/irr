# encoding: utf-8

class CarsRepaymentSearchPage
  include PageObject
  
  text_field :price_from, :name => "price[from]"
  text_field :price_to, :name => "price[to]"
  
  link :run_search, :id => "show-result-search"
  
  def set_parameter (hash)
    case hash['parameter']
    when "Цена"
      self.price_from = hash['min']
      self.price_to = hash['max']
    end
  end
end