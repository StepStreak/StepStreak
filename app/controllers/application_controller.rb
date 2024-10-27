class ApplicationController < ActionController::Base
  include Authenticatable

  with_options unless: -> { request.format.json? } do
    protect_from_forgery

    around_action :switch_locale

    before_action :authenticate_user!
    before_action :track
    before_action :save_app_version
  end

  def switch_locale(&action)

    if cookies[:device_locale].nil? || params[:locale] && cookies[:device_locale] != params[:locale]
      cookies[:device_locale] = params[:locale] || current_user&.locale
    end

    locale = current_user&.locale || cookies[:device_locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  helper_method :app_version, :device_type

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

  include PreRequest

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
