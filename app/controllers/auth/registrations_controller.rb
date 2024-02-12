# frozen_string_literal: true

module Auth
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(resource, _options = {})
      if resource.persisted?
        render json: {
          statu: :ok,
          message: 'Registration Successful',
          data: resource
        }
      else
        render json: {
          message: 'Registration Failed',
          errors: resource.errors.full_messages,
          status: :unprocessable_entity
        }
      end
    end
  end
end
