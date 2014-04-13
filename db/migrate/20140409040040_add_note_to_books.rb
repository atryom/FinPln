class AddNoteToBooks < ActiveRecord::Migration
  def change
    add_column :books, :note, :string
  end
end
