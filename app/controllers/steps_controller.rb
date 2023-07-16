class StepsController < ApplicationController
  def index
    activities = Activity.order(date: :asc).last(7)
    @steps = activities.map do |activity|
      {
        x: activity.date,
        y: activity.steps.zero? ? activity.steps + 50 : activity.steps
      }
    end
  end
end