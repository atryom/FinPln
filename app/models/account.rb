class Account < ActiveRecord::Base
  belongs_to :user

  def currency_code ()
    case self.currency
      when 'RUR'
        "Рубли"
      when 'USD'
        "Доллары"
      when 'EUR'
        "Евро"
    end
  end

  def currency_value ()
    case self.currency
      when 'RUR'
        sprintf("%0.02f р.", self.amount)
      when 'USD'
        sprintf("$ %0.02f", self.amount)
      when 'EUR'
        sprintf("%0.02f €", self.amount)
    end
  end
end
