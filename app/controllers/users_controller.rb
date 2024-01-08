class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_if_authenticated, except: [:destroy]
  before_action :check_if_test_user, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      sign_in @user

      redirect_path = if turbo_native_app? && app_version > 1.0
                        permissions_path
                      else
                        root_path
                      end

      redirect_to redirect_path, notice: "You are now signed in."
    else
      flash.now.alert = @user.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.destroy
      redirect_to welcome_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

  def check_if_test_user
    if current_user.test_user?
      sign_out current_user

      redirect_to root_path
    end
  end
end
