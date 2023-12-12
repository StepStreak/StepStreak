class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.joins("LEFT OUTER JOIN challenge_users ON challenge_users.challenge_id = challenges.id AND challenge_users.user_id = #{current_user.id}")
                           .select("challenges.*, CASE WHEN challenge_users.id IS NULL THEN false ELSE true END AS joined")
  end

  def show
    @challenge = Challenge.find(params[:id])
    @challenge_user = @challenge.challenge_users.find_by(user: current_user)
    @challenge_users = @challenge.challenge_users.select('*, RANK() OVER (ORDER BY score DESC) as rank').preload(:user)
    if @challenge_user
      @challenge_user_rank = @challenge_users.find {|challenge_user| challenge_user.id == @challenge_user.id }.rank

      @challenge_users = @challenge_users.to_a
      @challenge_users << @challenge_user_rank if @challenge_user_rank > 10
    end
  end
end
