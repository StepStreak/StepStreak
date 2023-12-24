class ApplicationController < ActionController::Base
  include Authenticatable

  protect_from_forgery unless: -> { request.format.json? }
  helper_method :app_version, :device_type

  before_action :authenticate_user!, unless: -> { request.format.json? }
  before_action :prints_request_info, unless: -> { request.format.json? }
  before_action :track, unless: -> { request.format.json? }

  def app_version
    if device_type == 'ios'
      request.user_agent.to_s.split('-').last.to_f
    elsif device_type == 'android'
      request.user_agent.to_s.split(';').first.split('-').last.to_f
    else
      1.0
    end
  end

  def device_type
    case request.user_agent.to_s
    when /iOS/
      'ios'
    when /Android/
      'android'
    else
      'web'
    end
  end

  def android_device?
    device_type == 'android'
  end

  def ios_device?
    device_type == 'ios'
  end

  def prints_request_info
    Rails.logger.info app_version
    Rails.logger.info device_type
  end

  def track
    if Rails.env.production? && current_user
      Logtail.with_context(user: { id: current_user.id }) do
        Rails.logger.info("Request: #{request.method} #{request.path}")
      end
    end
  end
end
