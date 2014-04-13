class Book < ActiveRecord::Base
  has_many :user_books, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :transactions, dependent: :destroy

  def book_full_summ
    self.accounts.sum("amount")
  end
end
