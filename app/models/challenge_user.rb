class ChallengeUser < ApplicationRecord
  include TournamentChallengeUser

  attr_accessor :code

  belongs_to :user
  belongs_to :challenge
  belongs_to :team, optional: true

  with_options on: :create do
    validates :user_id, uniqueness: { scope: :challenge_id }
    validate :code_validity, if: -> { challenge.locked? }
  end

  after_create_commit :update_score
  after_destroy_commit :delete_team, if: -> { challenge.team? && challenge.challenge_users.where(team: team).empty? }

  def delete_team
    team.destroy
  end

  def update_score
    challenge_starts_at = self.challenge.starts_at.in_time_zone('Europe/Berlin').to_date
    challenge_ends_at = self.challenge.ends_at.in_time_zone('Europe/Berlin').to_date

    score = self.user.activities
                .where(date: challenge_starts_at..challenge_ends_at)
                .sum(:steps)

    self.update(score: score)
  end

  def code_validity
    if self.code != self.challenge.code
      errors.add(:code, "is invalid")
    end
  end
end
