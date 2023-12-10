class Api::ApplicationController < ActionController::API
  include ApiAuth

  before_action :authenticate_user!
end
