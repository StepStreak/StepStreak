class Api::ApplicationController < ActionController::API
  include ApiAuth
  include PreRequest

  before_action :authenticate_user!

  def app_version; end

  def device_type; end
end
