# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Auth::RegistrationsController do
  let(:devise_mapping) { Devise.mappings[:user] }

  before do
    request.env['devise.mapping'] = devise_mapping
  end

  describe 'POST #create' do
    let(:valid_attributes) do
      {
        user: {
          email: 'test@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end

    context 'when the request is valid' do
      it 'creates a new user' do
        expect { post :create, params: valid_attributes }.to change(User, :count).by(1)
      end

      it 'returns a successful response' do
        post :create, params: valid_attributes
        expect(response).to have_http_status(:ok)
        expect(response.parsed_body).to eq({ 'statu' => 'ok', 'message' => 'Registration Successful' })
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { email: 'test@example.com', password: 'short', password_confirmation: 'short' } }

      it 'does not create a new user' do
        expect { post :create, params: { user: invalid_attributes } }.not_to change(User, :count)
      end

      it 'returns an error response' do
        post :create, params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body['errors']).not_to be_empty
      end
    end
  end
end
