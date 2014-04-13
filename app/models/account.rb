class Account < ActiveRecord::Base
  belongs_to :book

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

  def currency_code_icon ()
    case self.currency
      when 'RUR'
        '<i class="fa fa-rub"></i>'.html_safe
      when 'USD'
        '<span class="fa fa-dollar"></span>'.html_safe
      when 'EUR'
        '<span class="fa fa-euro"></span>'.html_safe
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
