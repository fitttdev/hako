# frozen_string_literal: true

module Auth
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, _options = {})
      render json: {
        message: 'Login Successful',
        data: resource
      }
    end

    def respond_to_on_destroy
      jwt_payload = JWT.decode(
        request.headers['Authorization'].split[1],
        ENV.fetch('DEVISE_JWT_SECRET_KEY', nil)
      ).first
      current_user = User.find(jwt_payload['sub'])

      if current_user
        render json: {
          status: 200,
          message: 'Logged out successfully'
        }, status: :ok
      else
        render json: {
          status: 401,
          message: 'User has no active session'
        }, status: :unauthorized
      end
    end
  end
end
