class Tournament < ApplicationRecord
  has_many :tournament_participants
  has_many :users, through: :tournament_participants

  has_many :challenges

  scope :active, -> { where('end_date >= ?', Date.current) }
  scope :ended, -> { where('end_date < ?', Date.current) }

  def active?
    end_date >= Date.current
  end

  def ended?
    end_date < Date.current
  end

  def started?
    start_date <= Date.current
  end
end