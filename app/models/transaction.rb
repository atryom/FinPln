class Transaction < ActiveRecord::Base
  def view_amount
    if self.completed
      sprintf("%0.02f р.", self.fact_amount)
    else
      sprintf("%0.02f р.", self.plan_amount)
    end
  end
  def view_date
    if self.completed
      self.fact_date.to_s(:ru_datetime)
    else
      self.plan_date.to_s(:ru_datetime)
    end
  end
end
