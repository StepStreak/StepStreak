class Challenge < ApplicationRecord
  include TournamentChallenge

  has_many :challenge_users, dependent: :delete_all
  has_many :users, through: :challenge_users
  has_many :teams

  enum challenge_type: [:solo, :team]
  enum mode: [:race, :milestone, :king_of_the_hill]

  scope :upcoming, -> { where('ends_at >= ?', DateTime.current) }
  scope :active, -> { where('starts_at <= ? AND ends_at >= ? AND finished IS false', DateTime.current, DateTime.current) }
  scope :ended, -> { where('ends_at < ? OR finished IS true', DateTime.current) }

  after_create_commit :schedule_reminder_job

  def active?
    ends_at >= DateTime.current
  end

  def ended?
    ends_at < DateTime.current || finished?
  end

  def started?
    starts_at <= DateTime.current
  end

  def start_at_in_iso8601
    starts_at.in_time_zone('Europe/Berlin').iso8601
  end

  def schedule_reminder_job
    ChallengeReminderJob.set(wait_until: ends_at - 5.hours).perform_later(self)
  end
end
