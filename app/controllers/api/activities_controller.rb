module Api
  class ActivitiesController < ApplicationController
    def create
      ActivitiesJob.perform_later(activity_params)
      render json: { message: 'Activities created' }, status: :accepted
    end

    private
    def activity_params
      params.require(:activity).map do |activity_params|
        activity_params.permit(
          :steps,
          :distance,
          :max_heart_rate,
          :date,
          :heart_rate,
          :calories,
          :resting_heart_rate
        )
      end
    end
  end
end
