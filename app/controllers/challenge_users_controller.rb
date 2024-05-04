class ChallengeUsersController < ApplicationController
  before_action :set_challenge

  def index
    @challenge_users = @challenge.challenge_users
  end

  def new
    @challenge_user = @challenge.challenge_users.build(user: current_user)
  end

  def create
    @challenge_user = @challenge.challenge_users.build(user: current_user, code: params[:code])
    if @challenge_user.save
      redirect_to challenge_path(@challenge), notice: "You have joined the challenge!"
    else
      flash[:alert] = @challenge_user.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @challenge_user = @challenge.challenge_users.find_by(user: current_user)
    if @challenge_user.destroy
      redirect_to challenges_path, notice: "You have left the challenge."
    else
      redirect_to challenge_path(@challenge), alert: "You could not leave the challenge."
    end
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end
end