class User < ApplicationRecord
  has_secure_password

  has_many :activities, dependent: :destroy

  has_many :challenge_users
  has_many :challenges, through: :challenge_users

  validates :email, presence: true, uniqueness: true

  normalizes :email, with: ->(email) { email.strip.downcase }
end
