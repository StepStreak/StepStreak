class User < ApplicationRecord
  has_secure_password

  has_many :activities, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  normalizes :email, with: ->(email) { email.strip.downcase }
end
