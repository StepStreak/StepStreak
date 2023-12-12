class Challenge < ApplicationRecord
  has_many :challenge_users
  has_many :users, through: :challenge_users

  enum challenge_type: [:solo, :team]
end
