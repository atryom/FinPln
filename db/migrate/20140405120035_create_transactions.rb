class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.string :note
      t.decimal :plan_amount
      t.date :plan_date
      t.decimal :fact_amount
      t.date :fact_date
      t.boolean :completed
      t.integer :group_id

      t.timestamps
    end
  end
end
