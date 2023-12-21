class ApplicationController < ActionController::Base
  include Authenticatable

  protect_from_forgery unless: -> { request.format.json? }
  helper_method :app_version, :device_type

  before_action :authenticate_user!, unless: -> { request.format.json? }

  def app_version
    request.user_agent.to_s.split('-').last.to_f
  end

  def device_type
    request.user_agent.to_s.match?(/iOS/) ? 'ios' : 'android'
  end
end
