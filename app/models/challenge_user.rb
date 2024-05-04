class ChallengeUser < ApplicationRecord
  attr_accessor :code

  belongs_to :user
  belongs_to :challenge
  belongs_to :team, optional: true

  with_options on: :create do
    validates :user_id, uniqueness: { scope: :challenge_id }
    validate :code_validity, if: -> { challenge.locked? }
  end

  after_create_commit :update_score
  after_create_commit :update_tournament_score, if: -> { challenge.tournament? }
  after_destroy_commit :delete_team, if: -> { challenge.team? && challenge.challenge_users.where(team: team).empty? }

  after_update_commit :update_tournament_score, if: -> { challenge.tournament? && saved_change_to_score? }

  def delete_team
    team.destroy
  end

  def update_score
    score = self.user.activities
                .where(date: self.challenge.starts_at.in_time_zone('Europe/Berlin').to_date..Date.current)
                .sum(:steps)

    self.update(score: score)
  end

  def update_tournament_score
    if challenge.solo?
      points = score / 100
    else
      points = score / 1000
    end

    challenge.tournament.tournament_participants.find_by(user: user).increment(:score, points)
  end

  def code_validity
    if self.code != self.challenge.code
      errors.add(:code, "is invalid")
    end
  end
end
