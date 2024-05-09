class AddTournamentScoreToChallengeUser < ActiveRecord::Migration[7.1]
  def change
    add_column :challenge_users, :tournament_score, :integer, default: 0
    add_reference :challenge_users, :tournament_participant, foreign_key: true, null: true
  end
end
