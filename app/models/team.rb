class Team < ApplicationRecord
  belongs_to :challenge

  has_many :challenge_users

  validates :name, presence: true, uniqueness: { scope: :challenge_id }
end
