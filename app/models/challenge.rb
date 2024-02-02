class Challenge < ApplicationRecord
  has_many :challenge_users
  has_many :users, through: :challenge_users
  has_many :teams

  enum challenge_type: [:solo, :team]

  scope :active, -> { where('ends_at >= ?', DateTime.current) }
  scope :ended, -> { where('ends_at < ?', DateTime.current) }

  def active?
    ends_at >= DateTime.current
  end

  def ended?
    ends_at < DateTime.current
  end

  def started?
    starts_at <= DateTime.current
  end
end
