
class ActivitiesJob < ApplicationJob
  include Rails.application.routes.url_helpers
  include Turbo::FramesHelper

  def perform(activities, user)
    activities.each do |activity|
      Activity.find_or_initialize_by(date: activity['date'], user: user).update(activity)
    end

    user.challenges.active.each do |challenge|
      challenge_user = challenge.challenge_users.find_by(user: user)
      challenge_user.update(score: user.activities.where(date: challenge.starts_at.to_date..Date.current).sum(:steps))
    end

    Turbo::StreamsChannel.broadcast_update_to(
      "activities_turbo_native_user_#{user.id}",
      target: 'dashboard-details',
      content: "<turbo-frame id='dashboard' src='#{Endpoint.root_url}/dashboard' data-controller='reload'>" )
  end
end

