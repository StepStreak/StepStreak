class Notification < ApplicationRecord
  belongs_to :user

  validates :title, :body, presence: true

  after_create_commit :send_notification

  scope :unread, -> { where(read: false) }

  private

  def send_notification
    return unless user.device_type.present? && user.notification_token.present?

    case user.device_type
    when "ios"
      send_ios_notification
    when "android"
      send_android_notification
    end

    Rpush.push
  end

  def send_ios_notification
    payload = {
      title: "StepStreak",
      subtitle: title,
      body: body
    }

    n = Rpush::Apns2::Notification.new
    n.app = Rpush::Apns2::App.find_by_name("ios_app")
    n.device_token = user.notification_token
    n.alert = payload
    n.save!
  end

  def send_android_notification
    payload = {
      title: "StepStreak",
      body: body
    }

    n = Rpush::Fcm::Notification.new
    n.app = Rpush::Fcm::App.where(name: "fcm_app").first
    n.device_token = user.notification_token
    n.notification = payload
    n.save!
  end
end
