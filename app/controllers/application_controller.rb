class ApplicationController < ActionController::Base
  include Authenticatable

  protect_from_forgery unless: -> { request.format.json? }
  helper_method :app_version, :device_type

  before_action :authenticate_user!, unless: -> { request.format.json? }
  before_action :prints_request_info

  def app_version
    request.user_agent.to_s.split('-').last.to_f
  end

  def device_type
    request.user_agent.to_s.match?(/iOS/) ? 'ios' : 'android'
  end

  def prints_request_info
    Rails.logger.info app_version
    Rails.logger.info device_type
  end
end
