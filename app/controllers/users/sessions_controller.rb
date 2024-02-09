# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, _options = {})
      render json: {
        message: 'Login Successful',
        data: resource
      }
    end
  end
end
