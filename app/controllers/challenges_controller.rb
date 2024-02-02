class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.joins("LEFT OUTER JOIN challenge_users ON challenge_users.challenge_id = challenges.id AND challenge_users.user_id = #{current_user.id}")
                           .select("challenges.*, CASE WHEN challenge_users.id IS NULL THEN false ELSE true END AS joined")
                           .active
                           .load

    @ended_challenges = Challenge.joins(:challenge_users)
                                 .where(challenge_users: { user_id: current_user.id })
                                 .select("challenges.*, true as joined")
                                 .order(created_at: :desc)
                                 .ended
                                 .load
  end

  def show
    @challenge = Challenge.find(params[:id])
    @challenge_user = @challenge.challenge_users.find_by(user: current_user)
    @challenge_users = @challenge.challenge_users.select('*, RANK() OVER (ORDER BY score DESC) as rank').preload(:user)

    if @challenge.team?
      @teams = @challenge.teams
                         .left_outer_joins(:challenge_users)
                         .select('teams.*, coalesce(SUM(challenge_users.score)) as score, RANK() OVER (ORDER BY SUM(challenge_users.score) DESC) as rank')
                         .group('teams.id' )
    end
  end
end
