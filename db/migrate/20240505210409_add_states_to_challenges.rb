class AddStatesToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :states, :json, default: {}
  end
end
