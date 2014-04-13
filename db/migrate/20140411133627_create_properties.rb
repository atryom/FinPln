class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.decimal :need_4_good
      t.decimal :bottleneck

      t.timestamps
    end
  end
end
