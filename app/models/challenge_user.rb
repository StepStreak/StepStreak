class ChallengeUser < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  validates :user_id, uniqueness: { scope: :challenge_id }

  after_create :update_score

  def update_score
    score = self.user.activities.where(date: self.challenge.starts_at.to_date..Date.current).sum(:steps)

    self.update(score: score)
  end
end
