class AddLockedToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :locked, :boolean, default: false
  end
end
