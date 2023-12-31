class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.integer :target
      t.references :user, null: false, foreign_key: true
      t.boolean :achieved, default: false
      t.string :month

      t.timestamps
    end
  end
end
