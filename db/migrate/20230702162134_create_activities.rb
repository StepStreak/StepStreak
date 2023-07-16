class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.integer :steps, default: 0
      t.float :calories, default: 0
      t.float :distance, default: 0
      t.date :date

      t.timestamps
    end

    add_index :activities, :date, unique: true
  end
end
