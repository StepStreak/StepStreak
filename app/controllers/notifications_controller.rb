class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.order(created_at: :desc)
    @unread_notifications = current_user.notifications.unread.size
  end

  def read_all
    current_user.notifications.unread.update_all(read: true)
    head :ok
  end
end