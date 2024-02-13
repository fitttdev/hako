# frozen_string_literal: true

module CurrentUser
  extend ActiveSupport::Concern

  class_methods do
    def current_user
      Thread.current[:current_user] ||= begin
        jwt_payload = extract_jwt_payload
        User.find(jwt_payload['sub']) if jwt_payload
      rescue JWT::DecodeError, JWT::VerificationError
        nil
      end
    end

    private

    def extract_jwt_payload
      return if request.headers['Authorization'].blank?

      token = request.headers['Authorization'].split.last
      JWT.decode(token, jwt_secret_key).first
    end

    def jwt_secret_key
      ENV.fetch('DEVISE_JWT_SECRET_KEY', nil)
    end
  end
end
