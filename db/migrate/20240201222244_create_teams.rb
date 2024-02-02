class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :challenge, null: false, foreign_key: true
      t.boolean :locked, default: false
      t.string :code

      t.timestamps
    end
  end
end
