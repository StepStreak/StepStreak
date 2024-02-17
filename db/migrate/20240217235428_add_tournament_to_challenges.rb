class AddTournamentToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_reference :challenges, :tournament, foreign_key: true
  end
end
