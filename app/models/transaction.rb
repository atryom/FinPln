class Transaction < ActiveRecord::Base
  belongs_to :book
  @@summ = 0
  @@line = 0
  @@cur_user
  @@day_for
  def view_amount
    if self.completed
      if (self.fact_amount != nil)
        sprintf("%0.02f р.", self.fact_amount)
      end
    else
      if (self.plan_amount != nil)
        sprintf("%0.02f р.", self.plan_amount)
      end
    end
  end
  def view_date
    if self.completed
      if self.fact_date != nil
        self.fact_date.to_s(:ru_datetime)
      end
    else
      if self.plan_date != nil
        self.plan_date.to_s(:ru_datetime)
      end
    end
  end

  def self.set_null_summ (summ, user)
    @@summ = summ
    @@cur_user = user
    @@line = 1
    @@day_for = Date.today
    if @@cur_user.property != nil
      @@n4g = @@cur_user.property[:need_4_good] / 30
    end
  end
  def add_def_amount
    if (self.plan_date != nil && self.plan_amount != nil)
      @@line += 1
      @@summ -= @@n4g * (self.plan_date - @@day_for) - self.plan_amount
      @@day_for = self.plan_date
      sprintf("%0.02f р.", @@summ)
    end
  end
end
