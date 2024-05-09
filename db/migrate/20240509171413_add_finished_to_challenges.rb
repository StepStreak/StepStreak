class AddFinishedToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :finished, :boolean, default: false
  end
end
