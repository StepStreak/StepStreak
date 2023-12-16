class Challenge < ApplicationRecord
  has_many :challenge_users
  has_many :users, through: :challenge_users

  enum challenge_type: [:solo, :team]

  scope :active, -> { where('starts_at <= ? AND ends_at >= ?', DateTime.current, DateTime.current) }
  scope :ended, -> { where.not('starts_at <= ? AND ends_at >= ?', DateTime.current, DateTime.current) }

  def active?
    starts_at <= DateTime.current && ends_at >= DateTime.current
  end

  def ended?
    ends_at < DateTime.current
  end
end
