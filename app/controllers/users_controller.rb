class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_if_authenticated

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      sign_in @user
      redirect_to root_path, notice: "You are now signed in."
    else
      flash.now.alert = @user.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
