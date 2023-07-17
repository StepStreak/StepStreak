class DistancesController < ApplicationController
  def index
    activities = Activity.order(date: :asc).last(7)
    @distances = activities.map do |activity|
      {
        x: activity.date,
        y: activity.distance.zero? ? activity.distance + 5 : activity.distance
      }
    end
  end
end