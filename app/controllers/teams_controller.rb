class TeamsController < ApplicationController
  before_action :set_challenge

  def index
    @teams = @challenge.teams
  end

  def new
    @team = @challenge.teams.build
  end

  def create
    @team = @challenge.teams.build(team_params)
    if @team.save && @challenge.challenge_users.create(user: current_user, team: @team)
      redirect_to challenge_path(@challenge)
    else
      render :new, status: :unprocessable_content
    end
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def team_params
    params.require(:team).permit(:name, :locked, :code)
  end
end