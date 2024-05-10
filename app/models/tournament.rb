class Tournament < ApplicationRecord
  has_many :tournament_participants
  has_many :users, through: :tournament_participants

  has_many :challenges

  scope :active, -> { where('end_date >= ?', Date.current) }

  scope :ended, -> { joins(:challenges)
                       .where('end_date < ?', Date.current)
                       .or(Challenge.ended) }

  def active?
    end_date >= Date.current
  end

  def ended?
    end_date < Date.current || challenges.ended.count == challenges.count
  end

  def started?
    start_date <= Date.current
  end

  def start_date_in_iso8601
    start_date.to_datetime.in_time_zone('Europe/Berlin').beginning_of_day.iso8601
  end
end
