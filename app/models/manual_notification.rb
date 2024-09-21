class ManualNotification < ApplicationRecord
  enum :device_type, [:all_devices, :ios, :android]

  after_create_commit :send_notification

  def send_notification
    ManualNotificationJob.perform_later(self)
  end
end
