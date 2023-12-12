class CreateChallenges < ActiveRecord::Migration[7.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.integer :challenge_type, default: 0
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
