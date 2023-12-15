module ApiAuth
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :user_signed_in?
  end

  def authenticate_user!
    render json: { message: 'Unauthorized' }, status: :unauthorized unless user_signed_in?
  end

  private

  def current_user
    Current.user ||= authenticate_user_from_token
  end

  def user_signed_in?
    current_user.present?
  end

  def decoded_token
    header = request.headers['Authorization']
    if header
      token = header.split(" ")[1]
      begin
        JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def authenticate_user_from_token
    if decoded_token
      user_id = decoded_token[0]['user_id']
      User.find_by(id: user_id)
    end
  end
end