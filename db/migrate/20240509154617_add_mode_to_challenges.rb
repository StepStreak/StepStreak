class AddModeToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :mode, :integer

    Challenge.all.update_all(mode: 0)
  end
end
