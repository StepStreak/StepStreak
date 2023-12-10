class ApplicationController < ActionController::Base
  include Authenticatable

  protect_from_forgery unless: -> { request.format.json? }

  before_action :authenticate_user!, unless: -> { request.format.json? }
end
