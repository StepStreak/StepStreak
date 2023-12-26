class ManualNotificationJob < ApplicationJob
  def perform(notification)
    scope = User.with_notification_token
    scope = scope.where(device_type: notification.device_type) unless notification.all_devices?

    scope.find_each do |user|
      Notification.create(
        user: user,
        title: notification.title,
        body: notification.body)
    end

    Rpush.push
    Rpush.apns_feedback
  end
end