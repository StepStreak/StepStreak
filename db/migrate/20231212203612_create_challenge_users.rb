class CreateChallengeUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :challenge_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
