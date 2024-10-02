class TeamChallengeUsersController < ApplicationController
  before_action :set_challenge
  before_action :set_team

  def create
    @challenge_user = @challenge.challenge_users.build(user: current_user, team: @team)
    if @challenge_user.save
      redirect_to challenge_path(@challenge)
    else
      flash[:alert] = @challenge_user.errors.full_messages.to_sentence
      render :new, status: :unprocessable_content
    end
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end