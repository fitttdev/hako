# frozen_string_literal: true

module CurrentUserAssigner
  extend ActiveSupport::Concern

  private

  def assign_current_user
    jwt_payload = extract_jwt_payload
    User.find_by(id: jwt_payload['sub']) if jwt_payload
  rescue JWT::DecodeError, JWT::VerificationError
    nil
  end

  def extract_jwt_payload
    return if request.headers['Authorization'].blank?

    token = request.headers['Authorization'].split.last
    JWT.decode(token, jwt_secret_key).first
  end

  def jwt_secret_key
    ENV.fetch('DEVISE_JWT_SECRET_KEY', nil)
  end
end
