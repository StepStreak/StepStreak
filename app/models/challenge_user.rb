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
  after_destroy_commit :delete_team, if: -> { challenge.team? && challenge.challenge_users.where(team: team).empty? }

  def delete_team
    team.destroy
  end

  def update_score
    score = self.user.activities.where(date: self.challenge.starts_at.to_date..Date.current).sum(:steps)

    self.update(score: score)
  end

  def code_validity
    if self.code != self.challenge.code
      errors.add(:code, "is invalid")
    end
  end
end
