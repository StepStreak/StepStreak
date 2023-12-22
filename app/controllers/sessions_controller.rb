class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :redirect_if_authenticated, only: :new

  def new; end

  def create
    if (user = User.authenticate_by(authentication_params))
      sign_in user

      redirect_path = if turbo_native_app? && app_version > 1.0
                        permissions_path
                      else
                        root_path
                      end

      redirect_to redirect_path
    else
      flash.now.alert = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out current_user
    redirect_to root_path, notice: "You are no longer signed in."
  end

  private

  def authentication_params
    {email: params[:email], password: params[:password]}
  end
end
