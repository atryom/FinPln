class RemoveUserIdFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :user_id
  end
end
