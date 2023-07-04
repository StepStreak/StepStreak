class CaloriesController < ApplicationController
  def index
    activities = Activity.last(7)
    @calories = activities.map do |activity|
      {
        x: activity.date,
        y: activity.calories.zero? ? activity.calories + 5 : activity.calories
      }
    end
  end
end