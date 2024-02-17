class Tournament < ApplicationRecord
  has_many :tournament_participants
  has_many :users, through: :tournament_participants

  has_many :challenges
end
