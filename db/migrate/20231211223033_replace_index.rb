class ReplaceIndex < ActiveRecord::Migration[7.1]
  def change
    remove_index :activities, :date
    add_index :activities, [:date, :user_id], unique: true
  end
end
