
class ActivitiesJob < ApplicationJob
  include Rails.application.routes.url_helpers
  include Turbo::FramesHelper

  def perform(activities)
    activities.each do |activity|
      Activity.find_or_initialize_by(date: activity['date']).update(activity)
    end

    Turbo::StreamsChannel.broadcast_update_to(
      "activities_job",
      target: 'dashboard-details',
      content: '<turbo-frame id="dashboard" src="http://192.168.0.89:3000/dashboard" data-controller="reload">' )
  end
end

