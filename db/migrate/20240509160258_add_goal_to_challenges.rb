class AddGoalToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :goal, :integer, default: 0
  end
end
