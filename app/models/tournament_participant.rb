class TournamentParticipant < ApplicationRecord
  belongs_to :tournament
  belongs_to :user
end
