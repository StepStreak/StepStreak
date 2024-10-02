class DashboardController < ApplicationController
  before_action :set_encoded_token, only: :show

  def index; end

  def show
    @active_tournament = current_user.active_tournament
    @daily_steps = Overview::ActivitiesThisMonthQuery.call(params[:date])
                                                         .group_by_day(:date, format: "%d")
                                                         .sum(:steps)
    @daily_heart_rate = {}
    [:heart_rate, :max_heart_rate].each { |type|
      @daily_heart_rate[type] = MaxHeartRatePerDay.call(type, params[:date])
    }

    @steps_this_month = Overview::ActivitiesThisMonthQuery.call(params[:date]).sum(:steps)
    @steps_last_month = Overview::ActivitiesLastMonthQuery.call.sum(:steps)
    @distance_this_month = Overview::ActivitiesThisMonthQuery.call(params[:date]).sum(:distance)
    @calories_this_month = Overview::ActivitiesThisMonthQuery.call(params[:date]).sum(:calories)
    @activities_this_month = Overview::ActivitiesThisMonthQuery.call(params[:date]).order(:date)
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