module Api
  class UsersController < ApplicationController
    def update
      if current_user.update(user_params)
        render plain: "OK"
      else
        render json: current_user.errors, status: :unprocessable_content
      end
    end

    private

    def user_params
      params.require(:user).permit(:device_type, :notification_token)
    end
  end
end
