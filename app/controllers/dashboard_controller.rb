class DashboardController < ApplicationController
  before_action :set_encoded_token, only: :show

  def index; end

  def show; end

  def overview
    @top_20_steps = Top20StepsQuery.call
  end

  private

  def set_encoded_token
    @encoded_token = JWT.encode({ user_id: current_user.id},
                                Rails.application.credentials.secret_key_base,
                                'HS256')
  end
end