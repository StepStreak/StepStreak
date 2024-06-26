class DashboardController < ApplicationController
  before_action :set_encoded_token, only: :show

  def index; end

  def show
    @active_tournament = current_user.active_tournament
  end

  def overview
    @top_20_steps = Top20StepsQuery.call
  end

  private

  def set_encoded_token
    expires_at = Time.zone.now.to_i + 1.hour.to_i
    payload = { user_id: current_user.id, exp: expires_at }

    @encoded_token = JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS256')
  end
end