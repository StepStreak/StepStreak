class Api::ApplicationController < ActionController::API
  include ApiAuth
  include PreRequest

  before_action :authenticate_user!
end
