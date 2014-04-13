class AddBookIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :book_id, :integer
  end
end
