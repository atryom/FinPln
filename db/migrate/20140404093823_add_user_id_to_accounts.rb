class AddUserIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :user_id, :integer
    add_column :accounts, :amount, :decimal
  end
end
