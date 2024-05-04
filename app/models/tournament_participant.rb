class TournamentParticipant < ApplicationRecord
  belongs_to :tournament
  belongs_to :user

  after_create_commit :create_challenge_users
  after_destroy_commit :destroy_challenge_users

  def create_challenge_users
    tournament.challenges.each do |challenge|
      challenge.challenge_users.create(user: user)
    end
  end

  def destroy_challenge_users
    tournament.challenges.each do |challenge|
      challenge.challenge_users.find_by(user: user)&.destroy
    end
  end
end
