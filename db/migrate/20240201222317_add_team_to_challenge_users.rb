class AddTeamToChallengeUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :challenge_users, :team, foreign_key: true
  end
end
