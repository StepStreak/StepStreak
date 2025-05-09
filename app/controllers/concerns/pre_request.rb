# frozen_string_literal: true

module PreRequest
  extend ActiveSupport::Concern

  included do
    before_action :log_request

    def log_request
      return if Rails.env.development?

      WebRequest.create(user_email: current_user&.email,
                        remote_ip: request.remote_ip,
                        original_remote_ip: request.headers['CF-Connecting-IP'],
                        forwarded_ip: request.headers['X-Forwarded-For'],
                        controller_class: request.controller_class,
                        original_path: request.original_fullpath,
                        app_version: app_version,
                        device_type: device_type,
                        method: request.method)
    end
  end
end
