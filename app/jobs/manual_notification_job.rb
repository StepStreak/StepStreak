class ManualNotificationJob < ApplicationJob
  def perform(notification)
    scope = User
    scope = scope.where(device_type: notification.device_type) unless notification.all_devices?

    scope.find_each do |user|
      Notification.create(
        user: user,
        title: notification.title,
        body: notification.body)
    end
  end
end