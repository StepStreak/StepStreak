class ApplicationController < ActionController::Base
  include Authenticatable

  protect_from_forgery unless: -> { request.format.json? }
  helper_method :app_version, :device_type

  before_action :redirect_if_old_host, unless: -> { request.format.json? }
  before_action :authenticate_user!, unless: -> { request.format.json? }
  before_action :prints_request_info, unless: -> { request.format.json? }
  before_action :track, unless: -> { request.format.json? }
  before_action :save_app_version, unless: -> { request.format.json? }

  def redirect_if_old_host
    if request.host == 'stepstreak.zajelbook.com' && request.path != '/unsupported'
      redirect_to unsupported_path
    end
  end

  def app_version
    if device_type == 'ios'
      request.user_agent.to_s.split('-').last
    elsif device_type == 'android'
      request.user_agent.to_s.split(';').first.split('-').last
    else
      '1.0'
    end.strip
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

  def save_app_version
    if current_user && device_type != 'web' && app_version != current_user.app_version
      current_user.update(app_version: app_version)
    end
  end

  def track
    if Rails.env.production? && current_user
      Logtail.with_context(user: { id: current_user.id }) do
        Rails.logger.info("Request: #{request.method} #{request.path}")
      end
    end
  end
end
